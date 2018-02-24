//
//  SuccessScreenAssembly.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class SuccessScreenAssembly {
    
    class func assembly(_ container: Container) {
        
        container.storyboardInitCompleted(SuccessViewController.self) { (resolver, controller) in
            controller.configurable = resolver.resolve(ModuleConfigurable.self)
            controller.presenter = resolver.resolve(SuccessScreenPresenter.self, argument: controller as SuccessViewProtocol)
        }
        
        container.register(SuccessScreenPresenter.self, factory: { (resolver, controller :SuccessViewProtocol) in
            let presenter = SuccessScreenPresenterImplementation()
            presenter.view = controller
            presenter.router = resolver.resolve(SuccessScreenRouter.self, argument: controller as SuccessViewProtocol)
            return presenter
        }).inObjectScope(ObjectScope.transient)
        
        container.register(SuccessScreenRouter.self, factory: { (_, controller :SuccessViewProtocol) in
            let router = SuccessScreenRouterImplementation()
            router.transitionHandler = controller
            return router
        }).inObjectScope(ObjectScope.transient)
        
        container.register(ModuleConfigurable.self) { _ in
            return SuccessfullScreenConfigurable()
        }.inObjectScope(ObjectScope.transient)
    }
}
