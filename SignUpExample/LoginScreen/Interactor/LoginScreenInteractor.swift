//
//  LoginScreenInteractor.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol LoginScreenInteractor {
    func performLogin(with user: User, success: @escaping ((Bool, String?) -> ()), failure: ((RequestError) -> ())?)
}
