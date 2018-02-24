//
//  SuccessfullScreenConfig.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/23/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

enum SuccessScreenConfig {
    case SuccessLogin
    case SuccessRegistration
}

struct SuccessScreenSetupConfiguration: ModuleConfiguration {
    var config: SuccessScreenConfig?
}
