//
//  Mocks.swift
//  WeatherAppTests
//
//  Created by David Norman on 8/3/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import UIKit
import PromiseKit
@testable import WeatherApp

class MockOpenWeatherInteractor: OpenWeatherInteractable {
    var invokedFetchWeatherAction = false
    var invokedFetchWeatherActionCount = 0
    var invokedFetchWeatherActionParameters: (locationType: LocationType, requestParams: OpenWeatherRequestParams, apiManager: OpenWeatherAPIManageable, viewController: OpenWeatherViewController)?
    var invokedFetchWeatherActionParametersList = [(locationType: LocationType, requestParams: OpenWeatherRequestParams, apiManager: OpenWeatherAPIManageable, viewController: OpenWeatherViewController)]()
    func fetchWeatherAction(for locationType: LocationType, requestParams: OpenWeatherRequestParams, apiManager: OpenWeatherAPIManageable, viewController: OpenWeatherViewController) {
        invokedFetchWeatherAction = true
        invokedFetchWeatherActionCount += 1
        invokedFetchWeatherActionParameters = (locationType, requestParams, apiManager, viewController)
        invokedFetchWeatherActionParametersList.append((locationType, requestParams, apiManager, viewController))
    }
    var invokedLocationValueChanged = false
    var invokedLocationValueChangedCount = 0
    var invokedLocationValueChangedParameters: (sender: UITextField, viewController: OpenWeatherViewController)?
    var invokedLocationValueChangedParametersList = [(sender: UITextField, viewController: OpenWeatherViewController)]()
    func locationValueChanged(sender: UITextField, viewController: OpenWeatherViewController) {
        invokedLocationValueChanged = true
        invokedLocationValueChangedCount += 1
        invokedLocationValueChangedParameters = (sender, viewController)
        invokedLocationValueChangedParametersList.append((sender, viewController))
    }
    var invokedLocationTypeDidChange = false
    var invokedLocationTypeDidChangeCount = 0
    var invokedLocationTypeDidChangeParameters: (sender: UISegmentedControl, viewController: OpenWeatherViewController)?
    var invokedLocationTypeDidChangeParametersList = [(sender: UISegmentedControl, viewController: OpenWeatherViewController)]()
    func locationTypeDidChange(sender: UISegmentedControl, viewController: OpenWeatherViewController) {
        invokedLocationTypeDidChange = true
        invokedLocationTypeDidChangeCount += 1
        invokedLocationTypeDidChangeParameters = (sender, viewController)
        invokedLocationTypeDidChangeParametersList.append((sender, viewController))
    }
}

class MockOpenWeatherViewController: OpenWeatherViewController {
    var invokedFetchWeatherButtonSetter = false
    var invokedFetchWeatherButtonSetterCount = 0
    var invokedFetchWeatherButton: UIButton?
    var invokedFetchWeatherButtonList = [UIButton?]()
    var invokedFetchWeatherButtonGetter = false
    var invokedFetchWeatherButtonGetterCount = 0
    var stubbedFetchWeatherButton: UIButton!
    override var fetchWeatherButton: UIButton! {
        set {
            invokedFetchWeatherButtonSetter = true
            invokedFetchWeatherButtonSetterCount += 1
            invokedFetchWeatherButton = newValue
            invokedFetchWeatherButtonList.append(newValue)
        }
        get {
            invokedFetchWeatherButtonGetter = true
            invokedFetchWeatherButtonGetterCount += 1
            return stubbedFetchWeatherButton
        }
    }
    var invokedLocationTextFieldSetter = false
    var invokedLocationTextFieldSetterCount = 0
    var invokedLocationTextField: UITextField?
    var invokedLocationTextFieldList = [UITextField?]()
    var invokedLocationTextFieldGetter = false
    var invokedLocationTextFieldGetterCount = 0
    var stubbedLocationTextField: UITextField!
    override var locationTextField: UITextField! {
        set {
            invokedLocationTextFieldSetter = true
            invokedLocationTextFieldSetterCount += 1
            invokedLocationTextField = newValue
            invokedLocationTextFieldList.append(newValue)
        }
        get {
            invokedLocationTextFieldGetter = true
            invokedLocationTextFieldGetterCount += 1
            return stubbedLocationTextField
        }
    }
    var invokedTempLabelSetter = false
    var invokedTempLabelSetterCount = 0
    var invokedTempLabel: UILabel?
    var invokedTempLabelList = [UILabel?]()
    var invokedTempLabelGetter = false
    var invokedTempLabelGetterCount = 0
    var stubbedTempLabel: UILabel!
    override var tempLabel: UILabel! {
        set {
            invokedTempLabelSetter = true
            invokedTempLabelSetterCount += 1
            invokedTempLabel = newValue
            invokedTempLabelList.append(newValue)
        }
        get {
            invokedTempLabelGetter = true
            invokedTempLabelGetterCount += 1
            return stubbedTempLabel
        }
    }
    var invokedIconImageViewSetter = false
    var invokedIconImageViewSetterCount = 0
    var invokedIconImageView: UIImageView?
    var invokedIconImageViewList = [UIImageView?]()
    var invokedIconImageViewGetter = false
    var invokedIconImageViewGetterCount = 0
    var stubbedIconImageView: UIImageView!
    override var iconImageView: UIImageView! {
        set {
            invokedIconImageViewSetter = true
            invokedIconImageViewSetterCount += 1
            invokedIconImageView = newValue
            invokedIconImageViewList.append(newValue)
        }
        get {
            invokedIconImageViewGetter = true
            invokedIconImageViewGetterCount += 1
            return stubbedIconImageView
        }
    }
    var invokedPressureLabelSetter = false
    var invokedPressureLabelSetterCount = 0
    var invokedPressureLabel: UILabel?
    var invokedPressureLabelList = [UILabel?]()
    var invokedPressureLabelGetter = false
    var invokedPressureLabelGetterCount = 0
    var stubbedPressureLabel: UILabel!
    override var pressureLabel: UILabel! {
        set {
            invokedPressureLabelSetter = true
            invokedPressureLabelSetterCount += 1
            invokedPressureLabel = newValue
            invokedPressureLabelList.append(newValue)
        }
        get {
            invokedPressureLabelGetter = true
            invokedPressureLabelGetterCount += 1
            return stubbedPressureLabel
        }
    }
    var invokedHumidityLabelSetter = false
    var invokedHumidityLabelSetterCount = 0
    var invokedHumidityLabel: UILabel?
    var invokedHumidityLabelList = [UILabel?]()
    var invokedHumidityLabelGetter = false
    var invokedHumidityLabelGetterCount = 0
    var stubbedHumidityLabel: UILabel!
    override var humidityLabel: UILabel! {
        set {
            invokedHumidityLabelSetter = true
            invokedHumidityLabelSetterCount += 1
            invokedHumidityLabel = newValue
            invokedHumidityLabelList.append(newValue)
        }
        get {
            invokedHumidityLabelGetter = true
            invokedHumidityLabelGetterCount += 1
            return stubbedHumidityLabel
        }
    }
    var invokedMinTempLabelSetter = false
    var invokedMinTempLabelSetterCount = 0
    var invokedMinTempLabel: UILabel?
    var invokedMinTempLabelList = [UILabel?]()
    var invokedMinTempLabelGetter = false
    var invokedMinTempLabelGetterCount = 0
    var stubbedMinTempLabel: UILabel!
    override var minTempLabel: UILabel! {
        set {
            invokedMinTempLabelSetter = true
            invokedMinTempLabelSetterCount += 1
            invokedMinTempLabel = newValue
            invokedMinTempLabelList.append(newValue)
        }
        get {
            invokedMinTempLabelGetter = true
            invokedMinTempLabelGetterCount += 1
            return stubbedMinTempLabel
        }
    }
    var invokedMaxTempLabelSetter = false
    var invokedMaxTempLabelSetterCount = 0
    var invokedMaxTempLabel: UILabel?
    var invokedMaxTempLabelList = [UILabel?]()
    var invokedMaxTempLabelGetter = false
    var invokedMaxTempLabelGetterCount = 0
    var stubbedMaxTempLabel: UILabel!
    override var maxTempLabel: UILabel! {
        set {
            invokedMaxTempLabelSetter = true
            invokedMaxTempLabelSetterCount += 1
            invokedMaxTempLabel = newValue
            invokedMaxTempLabelList.append(newValue)
        }
        get {
            invokedMaxTempLabelGetter = true
            invokedMaxTempLabelGetterCount += 1
            return stubbedMaxTempLabel
        }
    }
    var invokedLocationSegmentedControlSetter = false
    var invokedLocationSegmentedControlSetterCount = 0
    var invokedLocationSegmentedControl: UISegmentedControl?
    var invokedLocationSegmentedControlList = [UISegmentedControl?]()
    var invokedLocationSegmentedControlGetter = false
    var invokedLocationSegmentedControlGetterCount = 0
    var stubbedLocationSegmentedControl: UISegmentedControl!
    override var locationSegmentedControl: UISegmentedControl! {
        set {
            invokedLocationSegmentedControlSetter = true
            invokedLocationSegmentedControlSetterCount += 1
            invokedLocationSegmentedControl = newValue
            invokedLocationSegmentedControlList.append(newValue)
        }
        get {
            invokedLocationSegmentedControlGetter = true
            invokedLocationSegmentedControlGetterCount += 1
            return stubbedLocationSegmentedControl
        }
    }
    var invokedApiManagerSetter = false
    var invokedApiManagerSetterCount = 0
    var invokedApiManager: OpenWeatherAPIManager?
    var invokedApiManagerList = [OpenWeatherAPIManager]()
    var invokedApiManagerGetter = false
    var invokedApiManagerGetterCount = 0
    var stubbedApiManager: OpenWeatherAPIManager!
    override var apiManager: OpenWeatherAPIManager {
        set {
            invokedApiManagerSetter = true
            invokedApiManagerSetterCount += 1
            invokedApiManager = newValue
            invokedApiManagerList.append(newValue)
        }
        get {
            invokedApiManagerGetter = true
            invokedApiManagerGetterCount += 1
            return stubbedApiManager
        }
    }
    var invokedOpenWeatherRequestParamsSetter = false
    var invokedOpenWeatherRequestParamsSetterCount = 0
    var invokedOpenWeatherRequestParams: OpenWeatherRequestParams?
    var invokedOpenWeatherRequestParamsList = [OpenWeatherRequestParams]()
    var invokedOpenWeatherRequestParamsGetter = false
    var invokedOpenWeatherRequestParamsGetterCount = 0
    var stubbedOpenWeatherRequestParams: OpenWeatherRequestParams!
    override var openWeatherRequestParams: OpenWeatherRequestParams {
        set {
            invokedOpenWeatherRequestParamsSetter = true
            invokedOpenWeatherRequestParamsSetterCount += 1
            invokedOpenWeatherRequestParams = newValue
            invokedOpenWeatherRequestParamsList.append(newValue)
        }
        get {
            invokedOpenWeatherRequestParamsGetter = true
            invokedOpenWeatherRequestParamsGetterCount += 1
            return stubbedOpenWeatherRequestParams
        }
    }
    var invokedInteractorSetter = false
    var invokedInteractorSetterCount = 0
    var invokedInteractor: OpenWeatherInteractable?
    var invokedInteractorList = [OpenWeatherInteractable]()
    var invokedInteractorGetter = false
    var invokedInteractorGetterCount = 0
    var stubbedInteractor: OpenWeatherInteractable!
    override var interactor: OpenWeatherInteractable {
        set {
            invokedInteractorSetter = true
            invokedInteractorSetterCount += 1
            invokedInteractor = newValue
            invokedInteractorList.append(newValue)
        }
        get {
            invokedInteractorGetter = true
            invokedInteractorGetterCount += 1
            return stubbedInteractor
        }
    }
    var invokedViewModelSetter = false
    var invokedViewModelSetterCount = 0
    var invokedViewModel: OpenWeatherViewModel?
    var invokedViewModelList = [OpenWeatherViewModel]()
    var invokedViewModelGetter = false
    var invokedViewModelGetterCount = 0
    var stubbedViewModel: OpenWeatherViewModel!
    override var viewModel: OpenWeatherViewModel {
        set {
            invokedViewModelSetter = true
            invokedViewModelSetterCount += 1
            invokedViewModel = newValue
            invokedViewModelList.append(newValue)
        }
        get {
            invokedViewModelGetter = true
            invokedViewModelGetterCount += 1
            return stubbedViewModel
        }
    }
}

class MockOpenWeatherAPIManager: OpenWeatherAPIManageable {
    var invokedFetchWeather = false
    var invokedFetchWeatherCount = 0
    var invokedFetchWeatherParameters: (locationType: LocationType, requestParams: OpenWeatherRequestParams)?
    var invokedFetchWeatherParametersList = [(locationType: LocationType, requestParams: OpenWeatherRequestParams)]()
    var stubbedFetchWeatherResult: Promise<OpenWeatherModel>!
    func fetchWeather(for locationType: LocationType, requestParams: OpenWeatherRequestParams) -> Promise<OpenWeatherModel> {
        invokedFetchWeather = true
        invokedFetchWeatherCount += 1
        invokedFetchWeatherParameters = (locationType, requestParams)
        invokedFetchWeatherParametersList.append((locationType, requestParams))
        return stubbedFetchWeatherResult
    }
    var invokedFetchIcon = false
    var invokedFetchIconCount = 0
    var invokedFetchIconParameters: (iconName: String, Void)?
    var invokedFetchIconParametersList = [(iconName: String, Void)]()
    var stubbedFetchIconResult: Promise<UIImage>!
    func fetchIcon(named iconName: String) -> Promise<UIImage> {
        invokedFetchIcon = true
        invokedFetchIconCount += 1
        invokedFetchIconParameters = (iconName, ())
        invokedFetchIconParametersList.append((iconName, ()))
        return stubbedFetchIconResult
    }
}
