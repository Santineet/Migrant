//
//  Localize.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/18/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

extension UILabel: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = LocalizationManager.sharedInstance.localizedStringForKey(key: key ?? "", comment: "")
        }
    }
}
extension UIButton: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(LocalizationManager.sharedInstance.localizedStringForKey(key: key ?? "", comment: ""), for: .normal)
        }
   }
}
extension UITextField: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = LocalizationManager.sharedInstance.localizedStringForKey(key: key ?? "", comment: "")
        }
   }
}
