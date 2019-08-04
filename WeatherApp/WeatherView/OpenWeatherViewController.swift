//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Norman on 8/2/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import UIKit

protocol OpenWeatherInteractable {
    func fetchWeatherAction(for locationType: LocationType, requestParams: OpenWeatherRequestParams, apiManager: OpenWeatherAPIManageable, viewController: OpenWeatherViewController)
    func locationValueChanged(sender: UITextField, viewController: OpenWeatherViewController)
    func locationTypeDidChange(sender: UISegmentedControl, viewController: OpenWeatherViewController)
}

enum LocationType {
    case zipCode
    case city
}

struct OpenWeatherRequestParams {
    var zipCode: String = ""
    var city: String = ""
}

class OpenWeatherViewController: UIViewController {
    
    @IBOutlet weak var fetchWeatherButton: UIButton!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var locationSegmentedControl: UISegmentedControl!
    
    var apiManager = OpenWeatherAPIManager()
    var openWeatherRequestParams = OpenWeatherRequestParams(zipCode: "", city: "")
    var interactor: OpenWeatherInteractable = OpenWeatherInteractor()

    var viewModel: OpenWeatherViewModel = OpenWeatherViewModel(weatherModel: nil) {
        didSet {
            mapViewModelValuesToViews(viewModel: viewModel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        fetchWeatherButton.addTarget(self, action: #selector(fetchWeatherAction), for: .touchDown)
        locationTextField.addTarget(self, action: #selector(locationValueChanged), for: .editingChanged)
        locationSegmentedControl.addTarget(self, action: #selector(locationTypeDidChange), for: .valueChanged)
    }
    
    func setupSubViews() {
        title = Constants.appMainViewAppNavigationBarTitle
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(didTapTemperatureLabel))
        tempLabel.isUserInteractionEnabled = true
        tempLabel.addGestureRecognizer(tapAction)
        tempLabel.accessibilityTraits = [UIAccessibilityTraits.button]
        tempLabel.accessibilityHint = "Tap to change temperature measurement unit"
    }
    
    func mapViewModelValuesToViews(viewModel: OpenWeatherViewModel) {
        
        tempLabel.text = viewModel.tempLabelText
        if let iconID = viewModel.iconID {
            apiManager.fetchIcon(named: iconID).done { (image) in
                self.iconImageView.image = image
                }.catch { (error) in
                    AlertViewManager(handler: nil).present(in: self, errorMessage: Constants.errorGenericUserFacingMessage)
            }
        }
        
        pressureLabel.text = viewModel.pressureLabelText
        humidityLabel.text = viewModel.humidityLabelText
        minTempLabel.text = viewModel.minTempLabelText
        maxTempLabel.text = viewModel.maxTempLabelText
    }
    
    @objc func fetchWeatherAction() {
        interactor.fetchWeatherAction(for: viewModel.locationType, requestParams: openWeatherRequestParams, apiManager: apiManager, viewController: self)
    }
    
    @objc func locationValueChanged(_ sender: UITextField) {
        interactor.locationValueChanged(sender: sender, viewController: self)
    }
    
    @objc func locationTypeDidChange(_ sender: UISegmentedControl) {
        interactor.locationTypeDidChange(sender: sender, viewController: self)
    }
    
    @objc func didTapTemperatureLabel() {
        viewModel.measurementIndex += 1
    }
}

