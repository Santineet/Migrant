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
        static let currentLanguageKey = "current_language_key_somehashvalue"
        static let isFirstLaunchingKey = "is_first_launching_key_somehashvalue"

    }
    
    @UserDefault(UserDefaultsKeys.currentLanguageKey, defaultValue: "ru")
    static var currentLanguage: String
    
    @UserDefault(UserDefaultsKeys.isFirstLaunchingKey, defaultValue: true)
    static var isFirstLaunching: Bool
    

}
