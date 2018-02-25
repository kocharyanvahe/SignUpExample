//
//  UserCredentialsViewController.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit

class UserCredentialsViewController: UIViewController, UserCredentialsViewProtocol, TransitionHandler {
    
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var presenter: UserCredentialsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewIsReady()
    }
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        if checkBoxButton.isSelected {
            checkBoxButton.setImage(UIImage(named: "UnselectedCheckBoxImage"), for: .normal)
        } else {
            checkBoxButton.setImage(UIImage(named: "SelectedCheckBoxImage"), for: .normal)
        }
        checkBoxButton.isSelected = !checkBoxButton.isSelected
        if isTextFieldsNotEmpty() && checkBoxButton.isSelected {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        if isTextFieldsNotEmpty() {
            presenter.nextActionWith(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        }
    }
    
    @IBAction func textFieldsEditingChanged(_ sender: UITextField) {
        if isTextFieldsNotEmpty() {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func viewIsReady() {
        presenter.viewIsReady()
    }
    
    func fillCredentials(email: String, password: String) {
        emailTextField.text = email
        passwordTextField.text = password
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension UserCredentialsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            if isTextFieldsNotEmpty() {
                presenter.nextActionWith(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
            }
        default:
            break
        }
        return false
    }
    
    func isTextFieldsNotEmpty() -> Bool {
        guard let isEmailTextEmpty = emailTextField.text?.isEmpty, let isPasswordTextEmpty = passwordTextField.text?.isEmpty, 
            !isEmailTextEmpty, !isPasswordTextEmpty, checkBoxButton.isSelected else {
            return false
        }
        return true
    }
}
