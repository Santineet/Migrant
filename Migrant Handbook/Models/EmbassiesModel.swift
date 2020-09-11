//
//  EmbassiesModel.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/10/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class EmbassiesModel: Mappable {
    
    var address: String = ""
    var country: String = ""
    var email: String = ""
    var fax: String = ""
    var faxFirst: String = ""
    var faxSecond: String = ""
    var id: Int = 0
    var image: String = ""
    var mapLink: String = ""
    var phoneNumber: String = ""
    var phoneNumberFirst: String = ""
    var phoneNumberSecond: String = ""
    var resourseUrl: String = ""
    var site: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        address     <- map["address"]
        country     <- map["country"]
        email       <- map["email"]
        fax         <- map["fax"]
        faxFirst    <- map["fax_1"]
        faxSecond   <- map["fax_2"]
        id          <- map["id"]
        image       <- map["image"]
        mapLink     <- map["map_link"]
        phoneNumber     <- map["phone_number"]
        phoneNumberFirst    <- map["phone_number_1"]
        phoneNumberSecond   <- map["phone_number_2"]
        resourseUrl         <- map["resource_uri"]
        site                <- map["site"]
    }
}
