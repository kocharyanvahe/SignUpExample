//
//  ModuleConfigurableProvider.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/23/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol ModuleConfigurableProvider {
    var configurable: ModuleConfigurable? { get }
}
