//
//  PostsListController.swift
//  VeganOptionsPOA
//
//  Created by Camila Legramante Prestes on 24/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import UIKit

class PostsListController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var newPost: UITextView!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var postUser: UITextField!
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postsTableView: UITableView! {
        didSet {
            postsTableView.delegate = self
            postsTableView.dataSource = self
        }
    }
    
    var index = 0
    var posts: [Post] = []
    var placeId: String!
    var viewModel: PostsListViewModel!
    
    @IBAction func didTapCommentButton(_ sender: UIButton) {
        if postUser.text == "" {
            let alert = createAlert(alertTitle: "Não foi possível enviar sua recomendação.", buttonTitle: "Concluir", message: "Escreva um nome válido.")
            self.present(alert, animated: true, completion: nil)
        } else if postTitle.text == "" {
            let alert = createAlert(alertTitle: "Não foi possível enviar sua recomendação.", buttonTitle: "Concluir", message: "Escreva um título válido.")
            self.present(alert, animated: true, completion: nil)
        } else if newPost.text.isEmpty || newPost.text == "Faça sua recomendação ou escreva uma opinião" {
            let alert = createAlert(alertTitle: "Não foi possível enviar sua recomendação.", buttonTitle: "Concluir", message: "Escreva uma recomendação válida.")
            self.present(alert, animated: true, completion: nil)
        } else {
            guard let title = postTitle.text, let user = postUser.text else { return }
            let status = viewModel.sendPost(placeId: placeId, title: title, postText: newPost.text, user: user)
            if status {
                let alert = createAlert(alertTitle: "Recomendação enviada!", buttonTitle: "Concluir", message: "")
                self.present(alert, animated: true, completion: nil)
                newPost.text = "Faça sua recomendação ou escreva uma opinião"
                postTitle.text = ""
                postUser.text = ""
            } else {
                let alert = createAlert(alertTitle: "Erro ao enviar recomendação!", buttonTitle: "Concluir", message: "")
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newPost.delegate = self
        
        viewModel = PostsListViewModel(placeId: placeId)
        viewModel.delegate = self
        
        newPost!.layer.borderWidth = 0.5
        newPost!.layer.borderColor = UIColor.lightGray.cgColor
        newPost!.layer.cornerRadius = 5
        
        newPost.text = "Faça sua recomendação ou escreva uma opinião"
        newPost.textColor = UIColor.lightGray
        
        commentBtn.layer.cornerRadius = 5
        commentBtn.layer.borderWidth = 0.5
        commentBtn.layer.borderColor = UIColor.lightGray.cgColor
        
        self.hideKeyboard()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return textView.text.count + (text.count - range.length) <= 200
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if newPost.textColor == UIColor.lightGray {
            newPost.text = nil
            newPost.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if newPost.text.isEmpty {
            newPost.text = "Faça sua recomendação ou escreva uma opinião"
            newPost.textColor = UIColor.lightGray
        }
    }
}

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension PostsListController: PostsListViewModelDelegate {
    func updateData() {
        self.posts = viewModel.posts
        self.postsTableView.reloadData()
    }
}

extension PostsListController: UITableViewDelegate {
}

extension PostsListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostsListTableViewCell
        cell.postTitle.text = posts[indexPath.row].title
        cell.postData.text = posts[indexPath.row].date
        cell.postText.text = posts[indexPath.row].postText
        cell.postUsername.text = posts[indexPath.row].user
        return cell
    }
    
}
