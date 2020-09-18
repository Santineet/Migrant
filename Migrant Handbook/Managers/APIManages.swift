//
//  APIManages.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/25/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
       
    static let sharedInstance = APIManager()

    typealias Completion = (_ response: Any?, _ error: Error?, _ isSuccess: Bool) -> ()
    
    let baseUrl = "https://traffikunet.kg/api/v1/"
    
    var header: HTTPHeaders {
        if AppSettings.currentLanguage == "ru" {
            return ["Accept-Language": "RU"]
        } else {
            return ["Accept-Language": "KG"]
        }
    }
    
    func getCommonDate(completion: @escaping Completion) {
        guard let url = URL(string: baseUrl + "common_data/") else { return }
        RequestManager.request(with: url, method: .get,
                               params: nil, header: header,
                               completion: completion)
    }
    
    func getPolingPlaces(city: Int?, country: Int?,
                         completion: @escaping Completion) {
        guard var urlComponents = URLComponents(string: baseUrl + "poling-place/") else { return }
        if let cityID = city {
            urlComponents.queryItems = [
                URLQueryItem(name: "city", value: "\(cityID)")
            ]
        } else if let countryID = country {
            urlComponents.queryItems = [
                URLQueryItem(name: "city__country", value: "\(countryID)")
            ]
        }
        guard let url = urlComponents.url else { return }
        RequestManager.request(with: url, method: .get,
                               params: nil, header: header,
                               completion: completion)
    }
    
    func getCities(id: Int, completion: @escaping Completion) {
        guard let url = URL(string: baseUrl + "city/?country=\(id)") else { return }
        RequestManager.request(with: url, method: .get,
                               params: nil, header: header,
                               completion: completion)
    }
    
    func getCountries(completion: @escaping Completion) {
        guard let url = URL(string: baseUrl + "country/") else { return }
        RequestManager.request(with: url, method: .get,
                               params: nil, header: header,
                               completion: completion)
    }
    
}


struct RequestManager {
    typealias Completion = (_ response: Any?, _ error: Error?, _ isSuccess: Bool) -> ()
    
    static func request(with url: URL, method: HTTPMethod,
                        params: [String: Any]?, header: HTTPHeaders?,
                        completion: @escaping Completion) {
        AF.request(url, method: method, parameters: params,
                   encoding: JSONEncoding.default,
                   headers: header).responseJSON { response in
                    print(response.result as Any)
                    switch response.result {
                    case .success(let value):
                        if response.response?.statusCode ?? 0 < 220 {
                            completion(value, nil, true)
                        } else {
                            completion(value, nil, false)
                        }
                    case .failure(let error):
                        completion(nil, error, false)
                    }
        }
    }
}
