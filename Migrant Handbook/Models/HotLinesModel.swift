//
//  HotLinesModel.swift
//  Migrant Handbook
//
//  Created by Айрапетова Галина on 9/9/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class HotLinesModel: Mappable {
    
    var id: Int = 0
    var country = CountryModel()
    var phoneNumber: String = ""
    var resourceURL: String = ""
    var title: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        country <- map["country"]
        phoneNumber <- map["phone_number"]
        resourceURL <- map["resource_uri"]
        title <- map["title_ru"]
    }
}
