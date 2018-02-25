//
//  CountryCredentialsPresenterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class CountryCredentialsPresenterImplementation: CountryCredentialsPresenter {
    
    var router: CountryCredentialsRouter!
    var view: CountryCredentialsViewProtocol!
    var interactor: CountryCredentialsInteractor!
    
    private var requestCounter: Int = 0
    
    func registerAction() {
        router.openSuccessView()
    }
    
    func registerActionWith(city: String, country: String, postalCode: Int) {
        interactor.fillUseraddUserMetaData(city: city, country: country, postalCode: postalCode)
        requestCounter = 5
        guard let user = interactor.getUser() else { return }
        registerUser(user)
    }
    
    private func registerUser(_ user: User) {
        interactor.performRegistration(with: user, success: { (isSuccess, responseText) in
            if isSuccess {
                self.router.openSuccessView()
            }
        }) { (error) in
            switch error {
            case .NoInternetConnection:
                self.view.showError(message: Defines.Messages.NoInternetConnectionMessage.rawValue)
                return
            case .WrongCredentials:
                self.view.showError(message: Defines.Messages.WrongCredentials.rawValue)
                return
            case .TimeOut:
                if self.requestCounter > 0 {
                    self.requestCounter -= 1
                    self.registerUser(user)
                } else {
                    self.view.showError(message: Defines.Messages.TimeOut.rawValue)
                }
            case .PasswordTooShort:
                self.view.showError(message: Defines.Messages.PasswordTooShort.rawValue)
            case .UserAlreadyExist:
                self.view.showError(message: Defines.Messages.UserExist.rawValue)
            default:
                self.view.showError(message: Defines.Messages.UnknownError.rawValue)
            }
        }
    }
    
    func viewIsReady() {
         configureView()
    }
    
    func configureView() {
        guard let user = interactor.getUser() else { return }
        view.fillCredentials(email: user.email, city: user.city, country: user.country, postalCode: user.postal_code)
        view.checkingRegisterButtonVisibility()
    }
}
