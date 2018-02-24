//
//  LoginScreenAssembly.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class LoginScreenAssembly {
    class func assembly(_ container: Container) {
        
        container.storyboardInitCompleted(LoginView.self) { (resolver, controller) in
            controller.presenter = resolver.resolve(LoginScreenPresenter.self, argument: controller as LoginScreenViewProtocol)
        }
        
        container.register(LoginScreenPresenter.self, factory: { (resolver, controller :LoginScreenViewProtocol) in
            let presenter = LoginScreenPresenterImplementation()
            presenter.view = controller
            presenter.interactor = resolver.resolve(LoginScreenInteractor.self)
            presenter.router = resolver.resolve(LoginScreenRouter.self, argument: controller as LoginScreenViewProtocol)
            return presenter
        }).inObjectScope(ObjectScope.transient)
        
        container.register(LoginScreenRouter.self, factory: { (_, controller :LoginScreenViewProtocol) in
            let router = LoginScreenRouterImplementation()
            router.transitionHandler = controller
            return router
        }).inObjectScope(ObjectScope.transient)
        
        container.register(LoginScreenInteractor.self, factory: { resolver in
            let interactor = LoginScreenInteractorImplementation()
            interactor.loginService = resolver.resolve(LoginService.self)
            interactor.userManager = resolver.resolve(UserManager.self)
            return interactor
        }).inObjectScope(ObjectScope.transient)
    }
}
