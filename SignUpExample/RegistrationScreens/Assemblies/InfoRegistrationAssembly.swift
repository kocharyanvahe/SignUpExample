//
//  InfoRegistrationAssembly.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class InfoRegistrationAssembly {
    
    class func assembly(_ container: Container) {
        
        container.storyboardInitCompleted(InfoRegistrationViewController.self) { (resolver, controller) in
            controller.presenter = resolver.resolve(InfoRegistrationPresenter.self, argument: controller as InfoRegistrationViewProtocol)
        }
        
        container.register(InfoRegistrationPresenter.self, factory: { (resolver, controller :InfoRegistrationViewProtocol) in
            let presenter = InfoRegistrationPresenterImplementation()
            presenter.view = controller
            presenter.router = resolver.resolve(InfoRegistrationRouter.self, argument: controller as InfoRegistrationViewProtocol)
            return presenter
        }).inObjectScope(ObjectScope.transient)
        
        container.register(InfoRegistrationRouter.self, factory: { (_, controller :InfoRegistrationViewProtocol) in
            let router = InfoRegistrationRouterImplementation()
            router.transitionHandler = controller
            return router
        }).inObjectScope(ObjectScope.transient)
    }
}
