//
//  CountryModel.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/27/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class CountryModel: Mappable {
   
    var id: Int = 0
    var name: String = ""
    var imagePath: String = ""
    var resourceURL: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["country"]
        imagePath <- map["image"]
        resourceURL <- map["resource_uri"]
    }
}
