//
//  Database.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/27/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation

class Database {

    static let shared = Database()
    //Objects
    var rulesOfIncoming: [RulesOfIncomingModel] = []
    var eaesRules: [EaesRulesModel] = []    
    var frequentlyAskedQuestions: [FAQModel] = []
    
    var covidInfo: [DiseasesModel] = []
    var tuberkulezInfo: [DiseasesModel] = []
    var vichInfo: [DiseasesModel] = []
    var hotLines: [HotLinesModel] = []
    var embassies: [EmbassiesModel] = []

    public func prepareData() {
        let rulesOfIncomitPath = "json_rules_of_incoming_\(AppSettings.currentLanguage.rawValue)"
        let eaesRulesPath = "json_eaes_rules_\(AppSettings.currentLanguage.rawValue)"
        let faqPath = "json_faq_\(AppSettings.currentLanguage)"
       
        let covidPath = "json_covid_\(AppSettings.currentLanguage)"
        let tuberkulezPath = "json_tuberkulez_\(AppSettings.currentLanguage)"
        let vichPath = "json_vich_\(AppSettings.currentLanguage)"
        
        let hotLinePath = "json_hotline"
        
        let embassiesPath = "json_embassy"
        ///get json from file
        let rulesOfIncomitJson = Parser.json(with: rulesOfIncomitPath)
        let eaesRulesJson = Parser.json(with: eaesRulesPath)
        let faqJson = Parser.json(with: faqPath)
        let covidJson = Parser.json(with: covidPath)
        let tuberkulezJson = Parser.json(with: tuberkulezPath)
        let vichJson = Parser.json(with: vichPath)
        let hotLineJson = Parser.json(with: hotLinePath)
        let embassiesJson = Parser.json(with: embassiesPath)
        
        ///parse json
        if let jsonArray = rulesOfIncomitJson?["objects"].arrayObject {
            rulesOfIncoming = RulesOfIncomingModel.parseArray(JSONObject: jsonArray) ?? []
        }
        
        if let jsonArray = eaesRulesJson?["objects"].arrayObject {
            eaesRules = EaesRulesModel.parseArray(JSONObject: jsonArray) ?? []
        }
        
        if let jsonArray = faqJson?["objects"].arrayObject {
            frequentlyAskedQuestions = FAQModel.parseArray(JSONObject: jsonArray) ?? []
        }
        
        if let jsonArray = covidJson?["objects"].arrayObject {
            covidInfo = DiseasesModel.parseArray(JSONObject: jsonArray) ?? []
        }
        
        if let jsonArray = tuberkulezJson?["objects"].arrayObject {
            tuberkulezInfo = DiseasesModel.parseArray(JSONObject: jsonArray) ?? []
        }
        if let jsonArray = vichJson?["objects"].arrayObject {
            vichInfo = DiseasesModel.parseArray(JSONObject: jsonArray) ?? []
        }
        if let jsonArray = hotLineJson?["objects"].arrayObject {
            hotLines = HotLinesModel.parseArray(JSONObject: jsonArray) ?? []
<<<<<<< HEAD
=======
        } 
        if let jsonArray = embassiesJson?["objects"].arrayObject {
            embassies = EmbassiesModel.parseArray(JSONObject: jsonArray) ?? []
>>>>>>> 0007d3fc253d32b851744c88b53b7016008f2fcc
        }
    }
}
