//
//  ServiceAssembly.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class ServiceAssembly {
    
    class func assembly(_ container: Container) {
        
        container.register(LoginService.self) { r in
            let loginServiceImplementation = LoginServiceImplementation()
            loginServiceImplementation.networkRequest = NetworkRequestImplementation()
            return loginServiceImplementation
            }.inObjectScope(ObjectScope.container)
        
        container.register(RegistrationService.self) { r in
            let registrationServiceImplementation = RegistrationServiceImplementation()
            registrationServiceImplementation.networkRequest = NetworkRequestImplementation()
            return registrationServiceImplementation
            }.inObjectScope(ObjectScope.container)
    }
}
