//
//  UserCredentialsRouterImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class UserCredentialsRouterImplementation: UserCredentialsRouter {
    
    weak var transitionHandler: UserCredentialsViewProtocol!
    
    func openCountryCredentialsView() {
        guard let transitionHandler = transitionHandler as? TransitionHandler else { return }
        let moduleId = ModuleId(storyboardId: Storyboard.Registration.storyboardName,
                                controllerId: Storyboard.Registration.countryCredentialsViewControllerScene.rawValue,
                                transitionType: .push)
        transitionHandler.openModule(with: moduleId) { _ in }
    }
}
