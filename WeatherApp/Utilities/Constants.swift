//
//  Constants.swift
//  WeatherApp
//
//  Created by David Norman on 8/3/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import Foundation

struct Constants {
    
    // Error Messaging
    static let errorGenericUserFacingMessage = NSLocalizedString("There was an error, please double check your input", tableName: nil, bundle: Bundle.main, value: "There was an error, please double check your input", comment: "There was an error, please double check your input")
    static let errorTitle = NSLocalizedString("Error", tableName: nil, bundle: Bundle.main, value: "Error", comment: "Error")
    static let buttonActionTitle = NSLocalizedString("Ok", tableName: nil, bundle: Bundle.main, value: "Ok", comment: "Ok")

    // Location Segments
    static let locationZipcodeTitle = NSLocalizedString("Location: Zipcode", tableName: nil, bundle: Bundle.main, value: "Location: Zipcode", comment: "Location: Zipcode")
    static let locationCityTitle = NSLocalizedString("Location: City", tableName: nil, bundle: Bundle.main, value: "Location: City", comment: "Location: City")
    
    // ViewModel Label Text
    static let pressureLabelTextTemplate = NSLocalizedString("Pressure:", tableName: nil, bundle: Bundle.main, value: "Pressure:", comment: "Pressure:")
    static let pressureLabelTextDefault = NSLocalizedString("Pressure: ...", tableName: nil, bundle: Bundle.main, value: "Pressure: ...", comment: "Pressure: ...")
    
    static let humidityLabelTextTemplate = NSLocalizedString("Humidity:", tableName: nil, bundle: Bundle.main, value: "Humidity:", comment: "Humidity:")
    static let humidityLabelTextDefault = NSLocalizedString("Humidity: ...", tableName: nil, bundle: Bundle.main, value: "Humidity: ...", comment: "Humidity: ...")
    
    static let minTempLabelTextTemplate = NSLocalizedString("Min Temp:", tableName: nil, bundle: Bundle.main, value: "Min Temp:", comment: "Min Temp:")
    static let minTempLabelTextDefault = NSLocalizedString("Min Temp: ...", tableName: nil, bundle: Bundle.main, value: "Min Temp: ...", comment: "Min Temp: ...")
    
    static let maxTempLabelTextTemplate = NSLocalizedString("Max Temp:", tableName: nil, bundle: Bundle.main, value: "Max Temp:", comment: "Max Temp:")
    static let maxTempLabelTextDefault = NSLocalizedString("Max Temp: ...", tableName: nil, bundle: Bundle.main, value: "Max Temp: ...", comment: "Max Temp: ...")
    
    // Title
    static let appMainViewAppNavigationBarTitle = NSLocalizedString("Weather App", tableName: nil, bundle: Bundle.main, value: "Weather App", comment: "Weather App")
}
