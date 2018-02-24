//
//  WelcomeScreenAssembly.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class WelcomeScreenAssembly {
    
    class func assembly(_ container: Container) {
        
        container.storyboardInitCompleted(ViewController.self) { (resolver, controller) in
            controller.presenter = resolver.resolve(WelcomeScreenPresenter.self, argument: controller as WelcomeScreenViewProtocol)
        }
        container.register(WelcomeScreenPresenter.self, factory: { (resolver, controller : WelcomeScreenViewProtocol) in
            let presenter = WelcomeScreenPresenterImplementation()
            presenter.view = controller
            presenter.router = resolver.resolve(WelcomeScreenRouter.self, argument: controller as WelcomeScreenViewProtocol)
            return presenter
        }).inObjectScope(ObjectScope.transient)
        
        container.register(WelcomeScreenRouter.self, factory: { (_, controller : WelcomeScreenViewProtocol) in
            let router = WelcomeScreenRouterImplementation()
            router.transitionHandler = controller
            return router
        }).inObjectScope(ObjectScope.transient)
    }
}
