//
//  UserCredentialsInteractor.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/24/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol UserCredentialsInteractor {
    func getUser() -> User?
    func fillUser(email: String, password: String)
}
