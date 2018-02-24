//
//  InfoRegistrationPresenterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class InfoRegistrationPresenterImplementation: InfoRegistrationPresenter {
    var router: InfoRegistrationRouter!
    var view: InfoRegistrationViewProtocol!
    
    func nextAction() {
        router.openUserCredentialsView()
    }
}
