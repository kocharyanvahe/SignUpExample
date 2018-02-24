//
//  CountryCredentialsAssembly.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class CountryCredentialsAssembly {
    
    class func assembly(_ container: Container) {
        
        container.storyboardInitCompleted(CountryCredentialsViewController.self) { (resolver, controller) in
            controller.presenter = resolver.resolve(CountryCredentialsPresenter.self, argument: controller as CountryCredentialsViewProtocol)
        }
        
        container.register(CountryCredentialsPresenter.self, factory: { (resolver, controller :CountryCredentialsViewProtocol) in
            let presenter = CountryCredentialsPresenterImplementation()
            presenter.view = controller
            presenter.interactor = resolver.resolve(CountryCredentialsInteractor.self)
            presenter.router = resolver.resolve(CountryCredentialsRouter.self, argument: controller as CountryCredentialsViewProtocol)
            return presenter
        }).inObjectScope(ObjectScope.transient)
        
        container.register(CountryCredentialsRouter.self, factory: { (_, controller :CountryCredentialsViewProtocol) in
            let router = CountryCredentialsRouterImplementation()
            router.transitionHandler = controller
            return router
        }).inObjectScope(ObjectScope.transient)
        
        container.register(CountryCredentialsInteractor.self, factory: { resolver in
            let interactor = CountryCredentialsInteractorImplementation()
            interactor.registrationService = resolver.resolve(RegistrationService.self)
            interactor.userManager = resolver.resolve(UserManager.self)
            return interactor
        }).inObjectScope(ObjectScope.transient)
    }
}
