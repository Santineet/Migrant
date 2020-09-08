//
//  FAQModel.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/1/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import ObjectMapper

class FAQModel: Mappable {
   
    var id: Int = 0
    var answer: String = ""
    var question: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        answer <- map["answer_ru"]
        question <- map["question_ru"]
    }
}
