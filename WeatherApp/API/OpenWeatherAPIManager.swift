//
//  OpenWeatherAPIManager.swift
//  WeatherApp
//
//  Created by David Norman on 8/2/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import UIKit
import PromiseKit

protocol OpenWeatherAPIManageable {
    func fetchWeather(for locationType: LocationType, requestParams: OpenWeatherRequestParams) -> Promise<OpenWeatherModel>
    func fetchIcon(named iconName: String) -> Promise<UIImage>
}

class OpenWeatherAPIManager: OpenWeatherAPIManageable {
    
    func fetchWeather(for locationType: LocationType, requestParams: OpenWeatherRequestParams) -> Promise<OpenWeatherModel> {
        switch locationType {
        case .city:
            return fetchWeatherForCity(city: requestParams.city)
        case .zipCode:
            return fetchWeatherForZipCode(zipCode: requestParams.zipCode)
        }
    }
    
    private func fetchWeatherForCity(city: String) -> Promise<OpenWeatherModel> {
        let cityQuery = URLQueryItem(name: "q", value: "\(city.trimmingCharacters(in: .whitespacesAndNewlines))")
        return APIManager().sendRequest(queries: [cityQuery])
    }
    
    private func fetchWeatherForZipCode(zipCode: String) -> Promise<OpenWeatherModel> {
        let zipCodeQuery = URLQueryItem(name: "zip", value: "\(zipCode.trimmingCharacters(in: .whitespacesAndNewlines)),us")
        return APIManager().sendRequest(queries: [zipCodeQuery])
    }
    
    func fetchIcon(named iconName: String) -> Promise<UIImage> {
        let urlString = "http://openweathermap.org/img/w/\(iconName).png"
        let url = URL(string: urlString)!
        
        return firstly {
            URLSession.shared.dataTask(.promise, with: url)
            }
            .then(on: DispatchQueue.global(qos: .background)) { urlResponse in
                return  Promise.value(UIImage(data: urlResponse.data)!)
        }
    }
    
}
