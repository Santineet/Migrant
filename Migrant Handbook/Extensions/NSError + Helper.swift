//
//  NSError + Helper.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/13/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation

extension NSError {
    convenience init(message:String?, code: Int = 200) {
        let errorMessage = message != nil ? message : NSLocalizedString("Ошибка", comment: "")
        let userInfo: [String : Any] =
            [
                NSLocalizedDescriptionKey as String : errorMessage as Any
        ]
        self.init(domain: "",code: code, userInfo: userInfo)
    }
}
