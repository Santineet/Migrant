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
    let phone = number.replacingOccurrences(of: " ", with: "-")
    if let url = URL(string: "tel://\(phone)"),
        UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10, *) { UIApplication.shared.open(url) }
        else { UIApplication.shared.openURL(url) }
    }
    
}


struct Constants {
    static let unknownError = NSError(message: "Произошла неивестная ошибка, попробуйте позже")
}

