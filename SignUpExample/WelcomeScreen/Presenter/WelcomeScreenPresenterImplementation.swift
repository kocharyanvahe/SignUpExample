//
//  WelcomeScreenPresenterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class WelcomeScreenPresenterImplementation: WelcomeScreenPresenter {
    var router: WelcomeScreenRouter!
    var view: WelcomeScreenViewProtocol!
    
    func loginAction() {
        router.openLoginFlow()
    }
    
    func registerAction() {
        router.openRegistrationFlow()
    }
}
