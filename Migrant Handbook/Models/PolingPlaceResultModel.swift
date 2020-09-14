//
//  PolingPlaceResultModel.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/13/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class PolingPlaceResultModel: Mappable {
   
    var address: String = ""
    var city: Int = 0
    var email: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var phoneNumber1: String = ""
    var phoneNumber2: String = ""
    var placeNumber: Int = 0
    var title: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        address <- map["address"]
        city <- map["city"]
        email <- map["email"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        phoneNumber1 <- map["phone_number1"]
        phoneNumber2 <- map["phone_number2"]
        placeNumber <- map["place_number"]
        title <- map["title"]
    }
}
