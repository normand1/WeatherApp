//
//  Weather.swift
//  WeatherApp
//
//  Created by David Norman on 8/2/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import Foundation

struct WeatherModel: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

