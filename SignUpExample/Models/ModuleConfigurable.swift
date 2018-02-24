//
//  ModuleConfigurable.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/24/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol ModuleConfigurable {
    var config: ModuleConfiguration? { get }
    func configure(with configuration: ModuleConfiguration)
}
