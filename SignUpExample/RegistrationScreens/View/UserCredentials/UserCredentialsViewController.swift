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
    
    var presenter: UserCredentialsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewIsReady()
    }
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        if isTextFieldsNotEmpty() {
            presenter.nextActionWith(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
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
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
        guard let isEmailTextEmpty = emailTextField.text?.isEmpty, let isPasswordTextEmpty = passwordTextField.text?.isEmpty, !isEmailTextEmpty, !isPasswordTextEmpty else {
            return false
        }
        return true
    }
}
