//
//  NavigationHandler.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation
import UIKit

enum TransitionType {
    case modal
    case push
    case pop
}

struct ModuleId {
    var storyboardId: String?
    var controllerId: String?
    var transitionType: TransitionType
    
    init(storyboardId: String? = nil,
         controllerId: String? = nil,
         transitionType: TransitionType = .push) {
        self.storyboardId = storyboardId
        self.controllerId = controllerId
        self.transitionType = transitionType
    }
}

protocol ModuleConfiguration {
    
}

protocol TransitionHandler {
    func openModule(with moduleId: ModuleId, completion: @escaping (ModuleConfigurable) -> ())
    func closeModule()
}

extension TransitionHandler where Self: UIViewController {
    
    func openModule(with moduleId: ModuleId, completion: @escaping (ModuleConfigurable) -> ()) {
        switch moduleId.transitionType {
        case .modal:
            if let newViewController = createViewController(with: moduleId) {
                configureModule(newViewController, completion: completion)
                present(newViewController, animated: true, completion: nil)
            }
            
        case .push:
            if let navigationController = self.navigationController,
                let newViewController = createViewController(with: moduleId) {
                configureModule(newViewController, completion: completion)
                navigationController.pushViewController(newViewController, animated: true)
            }
            
        case .pop:
            if let navigationController = self.navigationController,
                let newViewController = createViewController(with: moduleId) {
                configureModule(newViewController, completion: completion)
                let transition = CATransition()
                transition.duration = 0.3
                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                transition.type = kCATransitionPush
                transition.subtype = kCATransitionFromLeft
                transition.fillMode = kCAFillModeRemoved
                navigationController.view.layer.add(transition, forKey: nil)
                navigationController.pushViewController(newViewController, animated: true)
            }
        }
    }
    
    private func createViewController(with moduleId: ModuleId) -> UIViewController? {
        var destinationViewController: UIViewController?
        
        if let storyboardId = moduleId.storyboardId {
            let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
            if let controllerId = moduleId.controllerId {
                destinationViewController = storyboard.instantiateViewController(withIdentifier: controllerId)
            } else {
                destinationViewController = storyboard.instantiateInitialViewController()
            }
        } else {
            if let controllerId = moduleId.controllerId {
                destinationViewController = storyboard?.instantiateViewController(withIdentifier: controllerId)
            } else {
                destinationViewController = storyboard?.instantiateInitialViewController()
            }
        }
        return destinationViewController
    }
    
    func configureModule(_ viewController: UIViewController, completion: @escaping (ModuleConfigurable) -> ()) {
        if let provider = viewController as? ModuleConfigurableProvider,
            let configurable = provider.configurable {
            completion(configurable)
        }
    }
    
    func closeModule() {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
