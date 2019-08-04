//
//  OpenWeatherModel.swift
//  WeatherApp
//
//  Created by David Norman on 8/2/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import Foundation

struct OpenWeatherModel: Codable {
    let weather: [WeatherModel]
    let main: MainModel
}
