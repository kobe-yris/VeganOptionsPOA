//
//  PostDetailControllerViewController.swift
//  VeganOptionsPOA
//
//  Created by Camila Legramante Prestes on 24/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import UIKit

class PostDetailController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var newPost: UITextView!
    @IBOutlet weak var commentBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newPost.delegate = self
        
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

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
