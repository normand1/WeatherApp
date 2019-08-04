//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by David Norman on 8/2/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import XCTest
import UIKit
@testable import WeatherApp

class WeatherAppTests: XCTestCase {
    
    var vc = OpenWeatherViewController()
    let interactor = MockOpenWeatherInteractor()
    let tempLabel = UILabel(frame: .zero)
    let pressureLabel = UILabel(frame: .zero)
    let humidityLabel = UILabel(frame: .zero)
    let minLabel = UILabel(frame: .zero)
    let maxLabel = UILabel(frame: .zero)
    let textField = UITextField(frame: .zero)
    let imageView = UIImageView(frame: .zero)

    override func setUp() {
        // Arrange
        
        vc = OpenWeatherViewController()
        
        vc.tempLabel = tempLabel
        vc.locationTextField = textField
        vc.pressureLabel = pressureLabel
        vc.humidityLabel = humidityLabel
        vc.minTempLabel = minLabel
        vc.maxTempLabel = maxLabel
        vc.iconImageView = imageView
        
        vc.interactor = interactor
    }

    override func tearDown() {
     
    }

    func testfetchWeatherAction() {
        // Arrange
        let vc = OpenWeatherViewController()
        let interactor = MockOpenWeatherInteractor()
        vc.interactor = interactor
        
        // Act
        vc.fetchWeatherAction()
        
        // Assert
        XCTAssert(interactor.invokedFetchWeatherAction)
    }
    
    func testLocationValueChangedAction() {
        
        // Arrange
        
        // Act
        vc.locationTextField.text = "TEST"
        vc.locationValueChanged(vc.locationTextField)
        
        // Assert
        XCTAssert(interactor.invokedLocationValueChanged)
        XCTAssertNotNil(interactor.invokedLocationValueChangedParameters?.viewController)
        XCTAssertEqual(interactor.invokedLocationValueChangedParameters?.viewController.locationTextField.text, "TEST")
    }
    
    func testLocationTypeChangedAction() {
        
        // Arrange
        let segmentedControl = UISegmentedControl(frame: .zero)
        vc.locationSegmentedControl = segmentedControl
        
        // Act
        vc.locationSegmentedControl.selectedSegmentIndex = 0
        vc.locationTypeDidChange(vc.locationSegmentedControl)
        
        // Assert
        XCTAssert(interactor.invokedLocationTypeDidChange)
        XCTAssert(interactor.invokedLocationTypeDidChange)
    }
    
    func testTempLabelUpdateIteratesToNextMeasurementUnits() {
        
        vc.didTapTemperatureLabel()
        XCTAssertEqual(vc.viewModel.measurementUnit, MeasurementUnit.celsius)
        
        vc.didTapTemperatureLabel()
        XCTAssertEqual(vc.viewModel.measurementUnit, MeasurementUnit.kelvin)
        
        vc.didTapTemperatureLabel()
        XCTAssertEqual(vc.viewModel.measurementUnit, MeasurementUnit.fahrenheit)
    }
    
    func testViewModelRenderingToViewControllerSubViews() {
        
        let mainModel = MainModel(temp: 283.4, pressure: 1015.38, humidity: 98, temp_min: 283.4, temp_max: 283.4)
        let weatherModel = WeatherModel(id: 3669881, main: "Rain", description: "light rain", icon: "10n")
        let openWeatherModel = OpenWeatherModel(weather: [weatherModel], main: mainModel)
        let viewModel = OpenWeatherViewModel(weatherModel: openWeatherModel)
        
        vc.viewModel = viewModel
        XCTAssertEqual(vc.tempLabel.text, "50.4℉")
        XCTAssertEqual(vc.pressureLabel.text, "Pressure: 1015.38 hPa")
        XCTAssertEqual(vc.humidityLabel.text, "Humidity: 98.0%")
        XCTAssertEqual(vc.minTempLabel.text, "Min Temp: 50.4℉")
        XCTAssertEqual(vc.maxTempLabel.text, "Max Temp: 50.4℉")
    }

}
