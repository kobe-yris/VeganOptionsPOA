//
//  Date+Extension.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 29/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

func getActualDate() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
    return dateFormatter.string(from: date)
}
