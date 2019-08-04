//
//  TemperatureConverterTests.swift
//  WeatherAppTests
//
//  Created by David Norman on 8/3/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import Foundation
import XCTest
@testable import WeatherApp

class TemperatureConverterTests: XCTestCase {
    
    func testConvertKtoF() {
        XCTAssertEqual(TemperatureConverter().temperatureMessage(kelvin: 300, measurementUnit: .fahrenheit), "80.3℉")
    }
    
    func testConvertKtoC() {
        XCTAssertEqual(TemperatureConverter().temperatureMessage(kelvin: 300, measurementUnit: .celsius), "26.9℃")
    }
    
    func testConvertKtoK() {
        XCTAssertEqual(TemperatureConverter().temperatureMessage(kelvin: 300, measurementUnit: .kelvin), "300.0K")
    }
}
