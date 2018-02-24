//
//  UserManager.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/23/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol UserManager {
    func createUser(email: String, password: String)
    func addUserMetaData(city: String, country: String, postalCode: Int)
    func updateUserCredentials(email: String, password: String)
    func getUser() -> User?
}
