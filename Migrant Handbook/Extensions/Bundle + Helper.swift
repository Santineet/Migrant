//
//  Bundle + Helper.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/26/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    static func setAppLanguage(language: LanguageType) {
        AppSettings.currentLanguage = language
        object_setClass(Bundle.main, PrivateBundle.self)
        objc_setAssociatedObject(Bundle.main, "bundlePath" ,Bundle.main.path(forResource: language.rawValue, ofType: "lproj"),.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func getAppLanguage() -> String {
        return Bundle.main.preferredLocalizations.first ?? ""
    }
}

class PrivateBundle: Bundle {
    
    var bundleAssociatedObject = "bundlePath"

    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        
        guard let bundlePath = objc_getAssociatedObject(self, &bundleAssociatedObject) as? String else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
        
        guard let bundle = Bundle(path: bundlePath) else{
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
        
        return bundle.localizedString(forKey: key, value: value, table: tableName)
    }
}
