//
//  InfoRegistrationRouterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class InfoRegistrationRouterImplementation: InfoRegistrationRouter {
    
    weak var transitionHandler: InfoRegistrationViewProtocol!
    
    func openUserCredentialsView() {
        guard let transitionHandler = transitionHandler as? TransitionHandler else { return }
        let moduleId = ModuleId(storyboardId: Storyboard.Registration.storyboardName,
                                controllerId: Storyboard.Registration.userCredentialsViewControllerScene.rawValue,
                                transitionType: .push)
        transitionHandler.openModule(with: moduleId) { _ in }
    }
}
