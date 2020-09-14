//
//  CommonDataModel.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/14/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class CommonDataModel: Mappable {
   
    var fbBot: String = ""
    var tgBot: String = ""
    var whatsappBot: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        fbBot <- map["fb_bot"]
        tgBot <- map["tg_bot"]
        whatsappBot <- map["whatsapp_bot"]
    }
}
