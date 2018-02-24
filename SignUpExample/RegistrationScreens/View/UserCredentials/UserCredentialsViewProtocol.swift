//
//  UserCredentialsViewProtocol.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol UserCredentialsViewProtocol: class {
    func fillCredentials(email: String, password: String)
}
