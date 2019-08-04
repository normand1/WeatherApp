//
//  OpenWeatherInteractor.swift
//  WeatherApp
//
//  Created by David Norman on 8/2/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import UIKit

struct OpenWeatherInteractor: OpenWeatherInteractable {
    
    func fetchWeatherAction(for locationType: LocationType, requestParams: OpenWeatherRequestParams, apiManager: OpenWeatherAPIManageable, viewController: OpenWeatherViewController) {
        apiManager.fetchWeather(for: locationType, requestParams: requestParams).done { [weak viewController] (weatherModel) in
            viewController?.viewModel.weatherModel = weatherModel
            }.catch { (error) in
                AlertViewManager(handler: nil).present(in: viewController, errorMessage: Constants.errorGenericUserFacingMessage)
        }
    }
    
    func locationValueChanged(sender: UITextField, viewController: OpenWeatherViewController) {
        switch viewController.viewModel.locationType {
        case .city:
            viewController.openWeatherRequestParams.city = sender.text ?? ""
        case .zipCode:
            viewController.openWeatherRequestParams.zipCode = sender.text ?? ""
        }
    }
    
    func locationTypeDidChange(sender: UISegmentedControl, viewController: OpenWeatherViewController) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewController.locationTextField.placeholder = Constants.locationZipcodeTitle
            viewController.locationTextField.text = ""
            viewController.openWeatherRequestParams.zipCode = ""
        case 1:
            viewController.locationTextField.placeholder = Constants.locationCityTitle
            viewController.locationTextField.text = ""
            viewController.openWeatherRequestParams.city = ""
        default:
            break
        }
        viewController.viewModel.locationTypeIndex = sender.selectedSegmentIndex
    }
    
}
