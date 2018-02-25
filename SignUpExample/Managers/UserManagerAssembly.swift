//
//  UserManagerAssembly.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/23/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class UserManagerAssembly {
    
    class func assembly(_ container: Container) {
        container.register(UserManager.self) { r in
            return UserManagerImplementation()
        }.inObjectScope(ObjectScope.container)
    }
}
