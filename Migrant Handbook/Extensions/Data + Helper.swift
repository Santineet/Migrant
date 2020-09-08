//
//  Data + Helper.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/28/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation

extension Data {
    var htmlAttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var htmlString: String {
        return htmlAttributedString?.string ?? ""
    }
}
