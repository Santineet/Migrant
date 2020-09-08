//
//  Mappable + Helper.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/27/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import ObjectMapper

extension Mappable {
    
    static func parse(JSONObject: Any?) -> Self? {
        if let JSONString = JSONObject as? String {
            return Mapper<Self>().map(JSONString: JSONString)
        }
        return Mapper<Self>().map(JSONObject: JSONObject)
    }
    
    static func parseArray(JSONObject: Any?) -> [Self]? {
        if let JSONString = JSONObject as? String {
            return Mapper<Self>().mapArray(JSONString: JSONString)
        }
        return Mapper<Self>().mapArray(JSONObject: JSONObject)
    }
    
}
