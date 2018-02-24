//
//  UserManagerImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/23/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class UserManagerImplementation: UserManager {
    
    private var user: User!
    
    func createUser(email: String, password: String) {
        user = User(email: email, password: password)
    }
    
    func addUserMetaData(city: String, country: String, postalCode: Int) {
        guard user != nil else { return }
        user.city = city
        user.country = country
        user.postal_code = postalCode
    }
    
    func updateUserCredentials(email: String, password: String) {
        guard user != nil else { return }
        user.email = email
        user.password = password
    }
    
    func getUser() -> User? {
        return user
    }
}
