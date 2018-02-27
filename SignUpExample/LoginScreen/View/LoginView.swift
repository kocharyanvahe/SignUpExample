//
//  LoginView.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/19/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit
import CRNotifications

class LoginView: UIViewController, LoginScreenViewProtocol, TransitionHandler {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var presenter: LoginScreenPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        if isTextFieldsNotEmpty() {
            presenter.loginAction(with: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        }
    }
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        presenter.backAction()
    }
    
    func showError(message: String) {
        CRNotifications.showNotification(type: .error, title: Defines.Messages.ErrorTitle.rawValue, message: message, dismissDelay: 1)
    }
    
    @IBAction func textFieldsEditingChanged(_ sender: UITextField) {
        if isTextFieldsNotEmpty() {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            if isTextFieldsNotEmpty() {
                presenter.loginAction(with: emailTextField.text ?? "", password: passwordTextField.text ?? "")
            }
        default:
            break
        }
        return false
    }
    
    func isTextFieldsNotEmpty() -> Bool {
        guard let isEmailTextEmpty = emailTextField.text?.isEmpty, let isPasswordTextEmpty = passwordTextField.text?.isEmpty, !isEmailTextEmpty, !isPasswordTextEmpty else {
            return false
        }
        return true
    }
}
