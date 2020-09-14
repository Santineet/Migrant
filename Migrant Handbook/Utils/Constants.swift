//
//  Constants.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/10/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

func callTo(number: String) {
    var number = number
    guard let first = number.first else { return }
    
    if first != "+" {
        number = "+" + number
    }
    
    if let url = URL(string: "tel://\(number)"),
        UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10, *) { UIApplication.shared.open(url) }
        else { UIApplication.shared.openURL(url) }
    }
}


struct Constants {
    static let unknownError = NSError(message: "Произошла неивестная ошибка, попробуйте позже")
}

