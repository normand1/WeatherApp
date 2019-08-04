//
//  TemperatureConverter.swift
//  WeatherApp
//
//  Created by David Norman on 8/3/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import Foundation

enum MeasurementUnit : Int {
    case celsius
    case fahrenheit
    case kelvin
}

class TemperatureConverter {
    
    private func convertCtoF(_ celsius : Double)->Double {
        let result = celsius * 1.8 + 32
        return result
    }
    
    private func convertFtoC(_ fahrenheit : Double)-> Double? {
        let result = ((fahrenheit - 32 ) * 5) / 9
        return result
    }
    
    private func convertKtoC(_ kelvin : Double)->Double {
        return kelvin - 273.15
    }
    
    private func convertCtoK(_ celsius : Double)->Double {
        return celsius + 273.15
    }
    
    private func convertFtoK(_ fahrenheit : Double)->Double {
        let result = (fahrenheit + 459.67) * (5 / 9)
        return result
    }
    
    private func convertKtoF(_ kelvin : Double)->Double {
        let result = (kelvin * (9/5)) - 459.67
        return result
    }
    
    private func correctTempForCurrentMeasurementUnit(_ kelvin: Double, measurementUnit : MeasurementUnit)->Double? {
        switch measurementUnit {
        case MeasurementUnit.celsius:
            return self.convertKtoC(kelvin)
        case MeasurementUnit.fahrenheit:
            return self.convertKtoF(kelvin)
        case MeasurementUnit.kelvin:
            return kelvin
        }
    }
    
    private func symbolForMeasurementUnit(_ measurementUnit : MeasurementUnit)->String {
        switch measurementUnit {
        case MeasurementUnit.celsius:
            return "℃"
        case MeasurementUnit.fahrenheit:
            return "℉"
        case MeasurementUnit.kelvin:
            return "K"
        }
    }
    
    func temperatureMessage(kelvin: Double, measurementUnit: MeasurementUnit) -> String {
        if let temperature = correctTempForCurrentMeasurementUnit(kelvin, measurementUnit: measurementUnit) {
            return String(format:"%.1f", temperature) + "\(symbolForMeasurementUnit(measurementUnit))"
        } else {
            return "\(symbolForMeasurementUnit(measurementUnit))"
        }
    }
}
