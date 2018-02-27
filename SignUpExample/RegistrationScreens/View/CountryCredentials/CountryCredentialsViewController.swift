//
//  CountryCredentialsViewController.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit
import CRNotifications

class CountryCredentialsViewController: UIViewController, CountryCredentialsViewProtocol, TransitionHandler {
    
    var presenter: CountryCredentialsPresenter!
    private let countries = ["Armenia", "Estonia", "Latvia", "Spain", "USA", "UK"]

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var postalIndexTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var currentUsernameLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewIsReady()
        setup()
    }

    @IBAction func registerTapped(_ sender: UIButton) {
        guard isFieldsNotEmpty() else { return }
        presenter.registerActionWith(city: cityTextField.text ?? "", country: countries[pickerView.selectedRow(inComponent: 0)] , postalCode: getIntFromPostalIndexTextField() ?? 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func textFieldsEditingChanged(_ sender: UITextField) {
        if isFieldsNotEmpty() {
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
        }
    }
    
    func viewIsReady() {
        presenter.viewIsReady()
    }
    
    private func setup() {
        let backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTapped(_:)))
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc func backTapped(_ sender: UIBarButtonItem) {
        presenter.backAction()
    }
    
    func showError(message: String) {
        CRNotifications.showNotification(type: .error, title: Defines.Messages.ErrorTitle.rawValue, message: message, dismissDelay: 1)
    }
    
    func fillCredentials(email: String, city: String?, country: String?, postalCode: Int?) {
        if let currentCityName = city {
            cityTextField.text = currentCityName
        }
        if let currentPostalCode = postalCode {
            postalIndexTextField.text = "\(currentPostalCode)"
        }
        if !email.isEmpty {
            currentUsernameLabel.text = "Current username: \(email)"
        }
        if let currentCountry = country {
            for i in 0..<countries.count {
                if countries[i] == currentCountry {
                    pickerView.selectRow(i, inComponent: 0, animated: false)
                }
            }
        }
    }
    
    func checkingRegisterButtonVisibility() {
        if isFieldsNotEmpty() {
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
        }
    }
    
    private func getIntFromPostalIndexTextField() -> Int? {
        if let text = postalIndexTextField.text {
            guard let int = Int(text) else { return nil }
            return int
        }
        return nil
    }
}

extension CountryCredentialsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Data Source
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    // MARK: - Picker View Delegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func isFieldsNotEmpty() -> Bool {
        guard let isCityTextEmpty = cityTextField.text?.isEmpty, let _ = getIntFromPostalIndexTextField(), !isCityTextEmpty else {
            return false
        }
        return true
    }
}

extension CountryCredentialsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case cityTextField:
            postalIndexTextField.becomeFirstResponder()
        case postalIndexTextField:
            if isFieldsNotEmpty() {
                presenter.registerActionWith(city: cityTextField.text ?? "", country: countries[pickerView.selectedRow(inComponent: 0)], postalCode: getIntFromPostalIndexTextField() ?? 0)
            }
        default:
            break
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == postalIndexTextField {
            let allowedChars = "1234567890"
            guard string.count > 0 else {
                return true
            }
            let currentText = textField.text ?? ""
            let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            return prospectiveText.containsOnlyCharactersIn(matchCharacters: allowedChars)
        } else {
            return true
        }
    }
}

private extension String {
    func containsOnlyCharactersIn(matchCharacters: String) -> Bool {
        let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }
}
