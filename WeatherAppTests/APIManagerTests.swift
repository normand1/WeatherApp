//
//  APIManagerTests.swift
//  WeatherAppTests
//
//  Created by David Norman on 8/3/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import XCTest
@testable import WeatherApp

class APIManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMakeURLRequest() {
        if let _ = try? APIManager().makeURLRequest(queries: [URLQueryItem(name: "q", value: "San Francisco")]) {
            
        } else {
            XCTFail()
        }
    }
    
    func testCreatePromiseForSendingRequest() {
        let promise = APIManager().sendRequest(queries: [URLQueryItem(name: "q", value: "San Francisco")])
        XCTAssertNotNil(promise)
    }
    
    func testCreatePromiseForFetchWeatherForLocation() {
        
        let cityRequestPromise = OpenWeatherAPIManager().fetchWeather(for: .city, requestParams: .init(zipCode: "", city: ""))
        XCTAssertNotNil(cityRequestPromise)
        
        let zipRequestPromise = OpenWeatherAPIManager().fetchWeather(for: .zipCode, requestParams: .init(zipCode: "", city: ""))
        XCTAssertNotNil(zipRequestPromise)
    }
    
    func testCreatePromiseForFetchIcon() {
        let iconPromise = OpenWeatherAPIManager().fetchIcon(named: "01d")
        XCTAssertNotNil(iconPromise)
    }

}
