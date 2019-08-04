//
//  APIManager.swift
//  WeatherApp
//
//  Created by David Norman on 8/2/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import Foundation
import PromiseKit

enum OpenWeatherError: Error {
    case localConfigurationFailure
}

class APIManager {
    
    func sendRequest(queries: [URLQueryItem]) -> Promise<OpenWeatherModel> {
        return firstly {
            URLSession.shared.dataTask(.promise, with: try makeURLRequest(queries: queries)).validate()
        }.map {
            try JSONDecoder().decode(OpenWeatherModel.self, from: $0.data)
            }
    }
    
    func makeURLRequest(queries: [URLQueryItem]) throws -> URLRequest {
        
        guard var urlComponents = URLComponents(string: "http://api.openweathermap.org/data/2.5/weather") else { throw OpenWeatherError.localConfigurationFailure }
        
        #error("Set Open Weather API Token before building, then remove this line of code")
        let appAuthItem = URLQueryItem(name: "APPID", value: "<#SET OPENWEATHER API TOKEN HERE#>")
        if urlComponents.queryItems == nil {
            urlComponents.queryItems = [appAuthItem]
        } else {
            urlComponents.queryItems?.append(appAuthItem)
        }
        
        urlComponents.queryItems?.append(contentsOf: queries)
        guard let url = urlComponents.url else { throw OpenWeatherError.localConfigurationFailure }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5)
        request.httpMethod = "GET"
        return request
    }
    
    
}
