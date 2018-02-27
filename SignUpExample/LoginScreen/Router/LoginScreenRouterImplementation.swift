//
//  LoginScreenRouterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class LoginScreenRouterImplementation: LoginScreenRouter {
    
    weak var transitionHandler: LoginScreenViewProtocol!
    
    func openSuccessfullScreen() {
        guard let transitionHandler = transitionHandler as? TransitionHandler else { return }
        let moduleId = ModuleId(storyboardId: Storyboard.Success.storyboardName,
                                controllerId: Storyboard.Success.successViewControllerScene.rawValue,
                                transitionType: .push)
        transitionHandler.openModule(with: moduleId) { configure in
            configure.configure(with: SuccessScreenSetupConfiguration(config: .SuccessLogin))
        }
    }
    
    func backButtonAction() {
        guard let transitionHandler = transitionHandler as? TransitionHandler else { return }
        let moduleId = ModuleId(storyboardId: Storyboard.Welcome.storyboardName,
                                controllerId: Storyboard.Welcome.welcomeViewControllerScene.rawValue,
                                transitionType: .pop)
        transitionHandler.openModule(with: moduleId) { _ in }
    }
}

