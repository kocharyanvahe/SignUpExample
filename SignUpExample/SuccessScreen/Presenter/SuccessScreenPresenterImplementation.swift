//
//  SuccessScreenPresenterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class SuccessScreenPresenterImplementation: SuccessScreenPresenter {
    var router: SuccessScreenRouter!
    var view: SuccessViewProtocol!
    
    private var configure: SuccessScreenSetupConfiguration?
    
    func setupModuleWithConfiguration(configuration: SuccessScreenSetupConfiguration) {
        configure = configuration
    }
    
}
