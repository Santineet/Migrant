//
//  String + Helper.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/26/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    var htmlToString: String {
        return Data(utf8).htmlString
    }
    
    var fileURL: URL {
        return URL(fileURLWithPath: self)
    }

    func appendingPathComponent(_ string: String) -> String {
        return fileURL.appendingPathComponent(string).path
    }

    var lastPathComponent:String {
        get {
            return fileURL.lastPathComponent
        }
    }
}

