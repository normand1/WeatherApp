//
//  OpenWeatherViewModel.swift
//  WeatherApp
//
//  Created by David Norman on 8/3/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import Foundation

struct OpenWeatherViewModel {
    
    var locationTypeIndex = 0 {
        didSet {
            locationType = locationTypes[locationTypeIndex]
        }
    }
    var locationType: LocationType = .zipCode
    var locationTypes: [LocationType] = [.zipCode, .city]
    let measurementUnits: [MeasurementUnit] = [.fahrenheit, .celsius, .kelvin]
    var measurementIndex = 0 {
        didSet {
            measurementIndex = measurementIndex % measurementUnits.count
        }
    }
    var measurementUnit: MeasurementUnit {
        get {
            return measurementUnits[measurementIndex]
        }
    }
    
    var tempLabelText: String {
        get {
            if let temperature = weatherModel?.main.temp {
                return TemperatureConverter().temperatureMessage(kelvin: temperature, measurementUnit: measurementUnit)
            } else {
                return "---"
            }
        }
    }
    var iconID: String? {
        get {
            return weatherModel?.weather.first?.icon
        }
    }
    var pressureLabelText: String {
        get  {
            if let pressure = weatherModel?.main.pressure {
                return "\(Constants.pressureLabelTextTemplate) \(pressure) hPa"
            } else {
                return Constants.pressureLabelTextDefault
            }
        }
    }
    var humidityLabelText: String {
        get {
            if let humidity = weatherModel?.main.humidity {
                return "\(Constants.humidityLabelTextTemplate) \(humidity)%"
            } else {
                return Constants.humidityLabelTextDefault
            }
        }
    }
    var minTempLabelText: String {
        get {
            if let minTemp = weatherModel?.main.temp_min {
                return "\(Constants.minTempLabelTextTemplate) \(TemperatureConverter().temperatureMessage(kelvin: minTemp, measurementUnit: measurementUnit))"
            } else {
                return Constants.minTempLabelTextDefault
            }
        }
    }
    var maxTempLabelText: String {
        get {
            if let maxTemp = weatherModel?.main.temp_max {
                return "\(Constants.maxTempLabelTextTemplate) \(TemperatureConverter().temperatureMessage(kelvin: maxTemp, measurementUnit: measurementUnit))"
            } else {
                return Constants.maxTempLabelTextDefault
            }
        }
    }
    
    var weatherModel: OpenWeatherModel?
    
    init(weatherModel: OpenWeatherModel?) {
        self.weatherModel = weatherModel
    }
}
