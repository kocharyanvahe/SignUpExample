//
//  RegistrationService.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol RegistrationService {
    func performRegistration(withUser: User,
                      success: @escaping ((Bool) -> ()),
                      failure: ((RequestError) -> ())?)
}
