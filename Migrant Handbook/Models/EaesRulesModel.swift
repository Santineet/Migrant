//
//  EaesRulesModel.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/27/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class EaesRulesModel: Mappable {
    
    var id: Int = 0
    var country = CountryModel()
    var resourceURL: String = ""
    var content: String = ""
    var title: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        country <- map["country"]
        resourceURL <- map["resource_uri"]
        content <- map["text_ru"]
        title <- map["title_ru"]
    }
}
