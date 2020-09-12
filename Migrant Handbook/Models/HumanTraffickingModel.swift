//
//  HumanTraffickingModel.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/11/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class HumanTraffickingModel: Mappable {
    
    var created: String = ""
    var id: Int = 0
    var image: String = ""
    var resourseUrl: String = ""
    var content: String = ""
    var title: String = ""
    var updated: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        created         <- map["created_at"]
        id              <- map["id"]
        image           <- map["image"]
        resourseUrl     <- map["resource_uri"]
        content         <- map["text_ru"]
        title           <- map["title_ru"]
        updated         <- map["updated_at"]
    }
}
