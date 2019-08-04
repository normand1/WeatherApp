//
//  OpenWeatherInteractorTests.swift
//  WeatherAppTests
//
//  Created by David Norman on 8/3/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import XCTest
@testable import WeatherApp
import PromiseKit

class OpenWeatherInteractorTests: XCTestCase {

    let interactor = OpenWeatherInteractor()
    var mockVC = MockOpenWeatherViewController()
    let mockApiManager = MockOpenWeatherAPIManager()
    let textField = UITextField()
    
    override func setUp() {
         let promise = Promise<OpenWeatherModel> { seal in }
        mockApiManager.stubbedFetchWeatherResult = promise
        
        let mainModel = MainModel(temp: 283.4, pressure: 1015.38, humidity: 98, temp_min: 283.4, temp_max: 283.4)
        let weatherModel = WeatherModel(id: 3669881, main: "Rain", description: "light rain", icon: "10n")
        let openWeatherModel = OpenWeatherModel(weather: [weatherModel], main: mainModel)
        let viewModel = OpenWeatherViewModel(weatherModel: openWeatherModel)
        mockVC = MockOpenWeatherViewController()
        mockVC.stubbedViewModel = viewModel
        mockVC.stubbedOpenWeatherRequestParams = OpenWeatherRequestParams(zipCode: "94538", city: "Fremont")
     
    }

    func testInteractorFetchWeatherActionInvokesAPIManager() {
        interactor.fetchWeatherAction(for: .city, requestParams: OpenWeatherRequestParams(zipCode: "", city: ""), apiManager: mockApiManager, viewController: mockVC)
        XCTAssert(mockApiManager.invokedFetchWeather)
        interactor.fetchWeatherAction(for: .zipCode, requestParams: OpenWeatherRequestParams(zipCode: "", city: ""), apiManager: mockApiManager, viewController: mockVC)
        XCTAssert(mockApiManager.invokedFetchWeather)
    }
    
    func testInteractorLocationValueChangedUpdatesZipcodeParamWithValueFromTextField() {
        mockVC.stubbedViewModel.locationType = .zipCode
        textField.text = "NEW ZIPCODE"
        interactor.locationValueChanged(sender: textField, viewController: mockVC)
        XCTAssert(mockVC.invokedOpenWeatherRequestParamsSetter)
        XCTAssertEqual(mockVC.invokedOpenWeatherRequestParamsList.first?.zipCode, "NEW ZIPCODE")
        XCTAssertEqual(mockVC.invokedOpenWeatherRequestParamsList.first?.city, "Fremont")
    }
    
    func testInteractorLocationValueChangedUpdatesCityParamsWithValueFromTexField() {
        mockVC.stubbedViewModel.locationType = .city
        textField.text = "NEW CITY"
        interactor.locationValueChanged(sender: textField, viewController: mockVC)
        XCTAssert(mockVC.invokedOpenWeatherRequestParamsSetter)
        XCTAssertEqual(mockVC.invokedOpenWeatherRequestParamsList.first?.zipCode, "94538")
        XCTAssertEqual(mockVC.invokedOpenWeatherRequestParamsList.first?.city, "NEW CITY")
    }
    
    func testLocationValueChangedClearsCityIfSelected() {
        mockVC.stubbedViewModel.locationType = .city
        interactor.locationValueChanged(sender: textField, viewController: mockVC)
        XCTAssert(mockVC.invokedOpenWeatherRequestParamsSetter)
        XCTAssertEqual(mockVC.invokedOpenWeatherRequestParamsList.first?.zipCode, "94538")
        XCTAssertEqual(mockVC.invokedOpenWeatherRequestParamsList.first?.city, "")
    }
    
    func testLocationValueChangedClearsZipcodeIfSelected() {
        mockVC.stubbedViewModel.locationType = .zipCode
        interactor.locationValueChanged(sender: textField, viewController: mockVC)
        XCTAssert(mockVC.invokedOpenWeatherRequestParamsSetter)
        XCTAssertEqual(mockVC.invokedOpenWeatherRequestParamsList.first?.zipCode, "")
        XCTAssertEqual(mockVC.invokedOpenWeatherRequestParamsList.first?.city, "Fremont")
    }
}
