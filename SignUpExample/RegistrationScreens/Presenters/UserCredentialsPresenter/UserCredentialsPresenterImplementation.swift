//
//  UserCredentialsPresenterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class UserCredentialsPresenterImplementation: UserCredentialsPresenter {
    
    var router: UserCredentialsRouter!
    var view: UserCredentialsViewProtocol!
    var interactor: UserCredentialsInteractor!
    
    func nextActionWith(email: String, password: String) {
        interactor.fillUser(email: email, password: password)
        router.openCountryCredentialsView()
    }
    
    func viewIsReady() {
        configureView()
    }
    
    func configureView() {
        guard let user = interactor.getUser() else { return }
        view.fillCredentials(email: user.email, password: user.password)
    }
    
    func backAction() {
        router.backButtonAction()
    }
}
