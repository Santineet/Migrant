//
//  MapViewModel.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/13/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import RxSwift
import RxCocoa

class MapViewModel {
    
    //BehaviorRelay
    var countriesBR = BehaviorRelay<[CountryResultModel]>(value: [])
    var citiesBR = BehaviorRelay<[CityResultModel]>(value: [])
    var polingPlacesBR = BehaviorRelay<[PolingPlaceResultModel]>(value: [])
    var commonDataBR = BehaviorRelay<CommonDataModel>(value: CommonDataModel())
    var errorBR = BehaviorRelay<Error>(value: NSError())

    func getCommonData() {
        APIManager.sharedInstance.getCommonDate { (response, error, isSuccess) in
            if let result = CommonDataModel.parse(JSONObject: response), isSuccess {
                self.commonDataBR.accept(result)
            } else {
                let error = error ?? Constants.unknownError
                self.errorBR.accept(error)
            }
        }
    }
    
    func getPolingPlaces(city: Int? = nil, country: Int? = nil) {
        APIManager.sharedInstance.getPolingPlaces(city: city, country: country) { (response, error, isSuccess) in
            if let result = PolingPlaceResultModel.parseArray(JSONObject: response) {
                self.polingPlacesBR.accept(result)
            } else {
                let error = error ?? Constants.unknownError
                self.errorBR.accept(error)
            }
        }
    }
    
    func getCities(id: Int) {
        APIManager.sharedInstance.getCities(id: id) { (response, error, isSuccess) in
            if let result = CityResultModel.parseArray(JSONObject: response), isSuccess {
                self.citiesBR.accept(result)
            } else {
                let error = error ?? Constants.unknownError
                self.errorBR.accept(error)
            }
        }
    }
    
    func getCountries() {
        APIManager.sharedInstance.getCountries { (response, error, isSuccess) in
            if let result = CountryResultModel.parseArray(JSONObject: response) {
                self.countriesBR.accept(result)
            } else {
                let error = error ?? Constants.unknownError
                self.errorBR.accept(error)
            }
        }
    }
}
