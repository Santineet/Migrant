//
//  DiseasesModel.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/3/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class DiseasesModel: Mappable {
   
    var id: Int = 0
    var image: String = ""
    var content: String = ""
    var title: String = ""
  
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        image <- map["image"]
        content <- map["text_ru"]
        title <- map["title_ru"]
    }
}
