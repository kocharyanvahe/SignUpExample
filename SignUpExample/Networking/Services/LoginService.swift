//
//  LoginService.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol LoginService {
    func performLogin(with user: User, success: @escaping ((Bool) -> ()), failure: ((RequestError) -> ())?)
}
