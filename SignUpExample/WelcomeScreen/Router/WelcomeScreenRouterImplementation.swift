//
//  WelcomeScreenRouterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation
import UIKit

final class WelcomeScreenRouterImplementation: WelcomeScreenRouter {
    
    weak var transitionHandler: WelcomeScreenViewInputProtocol!
    
    func openLoginFlow() {
        guard let transitionHandler = transitionHandler as? TransitionHandler else { return }
        let moduleId = ModuleId(storyboardId: Storyboard.Login.storyboardName,
                                controllerId: Storyboard.Login.loginViewControllerScene.rawValue,
                                transitionType: .push)
        transitionHandler.openModule(with: moduleId) { _ in }
    }
    
    func openRegistrationFlow() {
        guard let transitionHandler = transitionHandler as? TransitionHandler else { return }
        let moduleId = ModuleId(storyboardId: Storyboard.Registration.storyboardName,
                                controllerId: Storyboard.Registration.infoRegistrationViewControllerScene.rawValue,
                                transitionType: .push)
        transitionHandler.openModule(with: moduleId) { _ in }
    }
}
