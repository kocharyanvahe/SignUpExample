//
//  CountryCredentialsRouterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class CountryCredentialsRouterImplementation: CountryCredentialsRouter {
    weak var transitionHandler: CountryCredentialsViewProtocol!
    
    func openSuccessView() {
        guard let transitionHandler = transitionHandler as? TransitionHandler else { return }
        let moduleId = ModuleId(storyboardId: Storyboard.Success.storyboardName,
                                controllerId: Storyboard.Success.successViewControllerScene.rawValue,
                                transitionType: .push)
        transitionHandler.openModule(with: moduleId) { configure in
            configure.configure(with: SuccessScreenSetupConfiguration(config: .SuccessRegistration))
        }
    }
    
    func backButtonAction() {
        guard let transitionHandler = transitionHandler as? TransitionHandler else { return }
        let moduleId = ModuleId(storyboardId: Storyboard.Registration.storyboardName,
                                controllerId: Storyboard.Registration.userCredentialsViewControllerScene.rawValue,
                                transitionType: .pop)
        transitionHandler.openModule(with: moduleId) { _ in }
    }
}
