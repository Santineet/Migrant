//
//  RulesOfIncomingModel.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/27/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class RulesOfIncomingModel: Mappable {
   
    var id: Int = 0
    var title: String = ""
    var country = CountryModel()
    var content: String = ""
    var resourceURL: String = ""

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title_ru"]
        country <- map["country"]
        resourceURL <- map["resource_uri"]
        content <- map["text_ru"]
    }
}

