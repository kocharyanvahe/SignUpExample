//
//  LoginScreenPresenterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class LoginScreenPresenterImplementation: LoginScreenPresenter {
    
    var interactor: LoginScreenInteractor!
    var router: LoginScreenRouter!
    var view: LoginScreenViewProtocol!
    var requestCounter: Int = 0
    
    func loginAction(with email: String, password: String) {
        requestCounter = 5
        let user = createUser(with: email, password: password)
        loginUser(user)
    }
    
    private func createUser(with email: String, password: String) -> User {
        let user = User(email: email, password: password)
        return user
    }
    
    private func loginUser(_ user: User) {
        let error1 = RequestError.TimeOut
        interactor.performLogin(with: user, success: { (isSuccess, responseString) in
        }) { (error) in
            switch error1 {
            case .NoInternetConnection:
                self.view.showError(message: Defines.Messages.NoInternetConnectionMessage.rawValue)
                return
            case .WrongCredentials:
                self.view.showError(message: Defines.Messages.WrongCredentials.rawValue)
                return
            case .TimeOut:
                if self.requestCounter > 0 {
                    self.requestCounter -= 1
                    self.loginUser(user)
                } else {
                    self.view.showError(message: Defines.Messages.TimeOut.rawValue)
                }
            default:
                self.view.showError(message: Defines.Messages.UnknownError.rawValue)
            }
        }
    }
}
