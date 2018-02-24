//
//  UserCredentialsAssembly.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class UserCredentialsAssembly {
    
    class func assembly(_ container: Container) {
        
        container.storyboardInitCompleted(UserCredentialsViewController.self) { (resolver, controller) in
            controller.presenter = resolver.resolve(UserCredentialsPresenter.self, argument: controller as UserCredentialsViewProtocol)
        }
        
        container.register(UserCredentialsPresenter.self, factory: { (resolver, controller :UserCredentialsViewProtocol) in
            let presenter = UserCredentialsPresenterImplementation()
            presenter.view = controller
            presenter.interactor = resolver.resolve(UserCredentialsInteractor.self)
            presenter.router = resolver.resolve(UserCredentialsRouter.self, argument: controller as UserCredentialsViewProtocol)
            return presenter
        }).inObjectScope(ObjectScope.transient)
        
        container.register(UserCredentialsRouter.self, factory: { (_, controller :UserCredentialsViewProtocol) in
            let router = UserCredentialsRouterImplementation()
            router.transitionHandler = controller
            return router
        }).inObjectScope(ObjectScope.transient)
        
        container.register(UserCredentialsInteractor.self, factory: { resolver in
            let interactor = UserCredentialsInteractorImplementation()
            interactor.userManager = resolver.resolve(UserManager.self)
            return interactor
        }).inObjectScope(ObjectScope.transient)
    }
}
