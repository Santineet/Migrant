//
//  RegionModel.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/11/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class RegionModel: Mappable {
    
    var id: Int = 0
    var name: String = ""
    var resourceUrl: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        resourceUrl <- map["resource_uri"]
    }
}
