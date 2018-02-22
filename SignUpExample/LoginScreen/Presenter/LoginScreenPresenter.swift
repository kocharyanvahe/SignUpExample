//
//  LoginScreenPresenter.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol LoginScreenPresenter {
    func loginAction(with email: String, password: String)
}
