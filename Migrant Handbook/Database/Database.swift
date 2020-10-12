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
    var hotLinesCountry: [HotLineCountryModel] = []
    var hotLines: [HotLinesModel] = []
    var embassies: [EmbassiesModel] = []
    var consulate: [ConsulateModel] = []
    var humanTrafficking: [HumanTraffickingModel] = []
    var regions: [RegionModel] = []
    var listNKO: [NKOModel] = []
    
    public func prepareData() {
        let rulesOfIncomitPath = "json_rules_of_incoming_\(AppSettings.currentLanguage)"
        let eaesRulesPath = "json_eaes_rules_\(AppSettings.currentLanguage)"
        let faqPath = "json_faq_\(AppSettings.currentLanguage)"
       
        let covidPath = "json_covid_\(AppSettings.currentLanguage)"
        let tuberkulezPath = "json_tuberkulez_\(AppSettings.currentLanguage)"
        let vichPath = "json_vich_\(AppSettings.currentLanguage)"
        
        let hotLineCountryPath = "json_country_hotline"
        let hotLinePath = "json_hotline"
        
        let embassiesPath = "json_embassy"
        let consulatePath = "json_consulate"
        let humanTraffickingPath = "json_human_traffic_\(AppSettings.currentLanguage)"
        let regionsPath = "json_region"
        let listNKOPath = "json_nko_\(AppSettings.currentLanguage)"
       
        ///get json from file
        let rulesOfIncomitJson = Parser.json(with: rulesOfIncomitPath)
        let eaesRulesJson = Parser.json(with: eaesRulesPath)
        let faqJson = Parser.json(with: faqPath)
        let covidJson = Parser.json(with: covidPath)
        let tuberkulezJson = Parser.json(with: tuberkulezPath)
        let vichJson = Parser.json(with: vichPath)
        let hotLineCountryJson = Parser.json(with: hotLineCountryPath)
        let hotLineJson = Parser.json(with: hotLinePath)
        let embassiesJson = Parser.json(with: embassiesPath)
        let consulateJson = Parser.json(with: consulatePath)
        let humanTraffickingJson = Parser.json(with: humanTraffickingPath)
        let regionsJson = Parser.json(with: regionsPath)
        let listNKOJson = Parser.json(with: listNKOPath)
        
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
        if let jsonArray = hotLineCountryJson?["objects"].arrayObject {
            hotLinesCountry = HotLineCountryModel.parseArray(JSONObject: jsonArray) ?? []
        }
        if let jsonArray = hotLineJson?["objects"].arrayObject {
            hotLines = HotLinesModel.parseArray(JSONObject: jsonArray) ?? []
        } 
        if let jsonArray = embassiesJson?["objects"].arrayObject {
            embassies = EmbassiesModel.parseArray(JSONObject: jsonArray) ?? []
        }
        if let jsonArray = consulateJson?["objects"].arrayObject {
            consulate = ConsulateModel.parseArray(JSONObject: jsonArray) ?? []
        }
        if let jsonArray = humanTraffickingJson?["objects"].arrayObject {
            humanTrafficking = HumanTraffickingModel.parseArray(JSONObject: jsonArray) ?? []
        }
        if let jsonArray = regionsJson?["objects"].arrayObject {
            regions = RegionModel.parseArray(JSONObject: jsonArray) ?? []
        }
        if let jsonArray = listNKOJson?["objects"].arrayObject {
            listNKO = NKOModel.parseArray(JSONObject: jsonArray) ?? []
        }
    }
}
