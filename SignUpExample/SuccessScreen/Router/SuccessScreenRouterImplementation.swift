//
//  SuccessScreenRouterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class SuccessScreenRouterImplementation: SuccessScreenRouter {
    
    weak var transitionHandler: SuccessViewProtocol!
    
    func backButtonAction() {
        guard let transitionHandler = transitionHandler as? TransitionHandler else { return }
        let moduleId = ModuleId(storyboardId: Storyboard.Welcome.storyboardName,
                                controllerId: Storyboard.Welcome.welcomeViewControllerScene.rawValue,
                                transitionType: .pop)
        transitionHandler.openModule(with: moduleId) { _ in }
    }
}
