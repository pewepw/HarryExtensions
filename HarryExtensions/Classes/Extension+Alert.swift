//
//  Extension+Alert.swift
//
//
//  Created by Harry on 01/05/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showAlert(title: String, message: String, completed: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel) { (action) in
            completed()
        }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    public func showErrorAlert(message: String, completed: @escaping () -> Void) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel) { (action) in
            completed()
        }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    public func showSuccessAlert(message: String, completed: @escaping () -> Void) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel) { (action) in
            completed()
        }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
