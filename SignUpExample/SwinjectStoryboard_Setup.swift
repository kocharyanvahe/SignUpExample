//
//  SwinjectStoryboard_Setup.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        Container.loggingFunction = nil
        // ServiceAssembly layer
        ServiceAssembly.assembly(defaultContainer)
        
        // Welcome module
        WelcomeScreenAssembly.assembly(defaultContainer)
        
        // Login module
        LoginScreenAssembly.assembly(defaultContainer)
        
        // Registration modules
        
    }
}
