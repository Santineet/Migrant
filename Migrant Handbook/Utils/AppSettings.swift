//
//  AppSettings.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/25/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation

enum LanguageType: String {
    case kg = "kg"
    case ru = "ru"
}

struct AppSettings {
    
    struct UserDefaultsKeys {
        static let tokenKey = "token_key_somehashvalue"
        static let currentLanguageKey = "current_language_key_somehashvalue"
    }
    
    @UserDefault(UserDefaultsKeys.tokenKey, defaultValue: "")
    static var token: String
    
    @UserDefault(UserDefaultsKeys.currentLanguageKey, defaultValue: .ru)
    static var currentLanguage: LanguageType

}
