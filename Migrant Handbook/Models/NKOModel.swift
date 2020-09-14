//
//  NKOModel.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/12/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class NKOModel: Mappable {
    
    var address: String = ""
    var created: String = ""
    var id: Int = 0
    var mail: String = ""
    var manager: String = ""
    var mapLink: String = ""
    var phoneNumber: String = ""
    var phoneNumberSecond: String = ""
    var region = RegionModel()
    var resourceURL: String = ""
    var text: String = ""
    var title: String = ""
    var updated: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        address             <- map["address"]
        created             <- map["created_at"]
        id                  <- map["id"]
        mail                <- map["mail"]
        manager             <- map["manager"]
        mapLink             <- map["map_link"]
        phoneNumber         <- map["phone_number"]
        phoneNumberSecond   <- map["phone_number_1"]
        region              <- map["region"]
        resourceURL         <- map["resource_uri"]
        text                <- map["text_ru"]
        title               <- map["title_ru"]
        updated             <- map["updated_at"]
    }
}

