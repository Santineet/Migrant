//
//  ConsulateModel.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/14/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class ConsulateModel: Mappable {
    
    var address: String = ""
    var embassies = EmbassiesModel()
    var id: Int = 0
    var mapLink: String = ""
    var phoneNumber: String = ""
    var phoneNumberSecond: String = ""
    var phoneNumberThird: String = ""
    var region: String = ""
    var resourseUrl: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        address             <- map["address"]
        embassies           <- map["embassy"]
        id                  <- map["id"]
        mapLink             <- map["map_link"]
        phoneNumber         <- map["phone_number"]
        phoneNumberSecond   <- map["phone_number_1"]
        phoneNumberThird    <- map["phone_number_2"]
        region              <- map["region"]
        resourseUrl         <- map["resource_uri"]
    }
}
