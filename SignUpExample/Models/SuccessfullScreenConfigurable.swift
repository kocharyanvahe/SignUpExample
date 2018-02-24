//
//  SuccessfullScreenConfigurable.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/24/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class SuccessfullScreenConfigurable: ModuleConfigurable {
    var config: ModuleConfiguration?
    
    func configure(with configuration: ModuleConfiguration) {
        config = configuration
    }
}
