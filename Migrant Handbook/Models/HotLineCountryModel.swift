//
//  File.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/14/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class HotLineCountryModel: Mappable {
    
    var country: String = ""
    var id: Int = 0
    var image: String = ""
    var resourseUrl: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        country     <- map["country"]
        id          <- map["id"]
        image       <- map["image"]
        resourseUrl <- map["resource_uri"]
    }
}
