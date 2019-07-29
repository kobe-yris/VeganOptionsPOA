//
//  Alert+Extension.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 28/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation
import UIKit

func createAlert(alertTitle: String, buttonTitle: String, message: String) -> UIAlertController {
    let actionController = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
    actionController.addAction(defaultAction)
    return actionController
}
