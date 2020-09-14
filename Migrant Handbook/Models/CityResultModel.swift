//
//  CityResultModel.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/13/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class CityResultModel: Mappable {
   
    var country: Int = 0
    var id: Int = 0
    var title: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        country <- map["country"]
        id <- map["id"]
        title <- map["title"]
    }
}
