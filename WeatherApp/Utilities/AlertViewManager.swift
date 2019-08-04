//
//  AlertViewManager.swift
//  WeatherApp
//
//  Created by David Norman on 8/3/19.
//  Copyright © 2019 David Norman. All rights reserved.
//

import UIKit

struct AlertViewManager {
    
    let handler: (() -> Void)?
    
    func present(in viewController: UIViewController, errorMessage: String) {
        let alert = UIAlertController(
            title: Constants.errorTitle,
            message: errorMessage,
            preferredStyle: .alert
        )
        
        let acceptAction = UIAlertAction(title: Constants.buttonActionTitle, style: .default) { _ in
            if let handler = self.handler {
                handler()
            }
        }
        
        alert.addAction(acceptAction)
        viewController.present(alert, animated: true)
    }
}
