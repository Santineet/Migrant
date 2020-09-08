//
//  Parser.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/25/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import SwiftyJSON

class Parser {
    static func json(with path: String) -> JSON? {
        guard let jsonPath = Bundle.main.path(forResource: path, ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)),
            let json = try? JSON(data: jsonData) else {
            return nil
        }

        return json
    }
}
