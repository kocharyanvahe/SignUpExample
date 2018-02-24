//
//  UserCredentialsInteractorImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/24/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class UserCredentialsInteractorImplementation: UserCredentialsInteractor {
    
    var userManager: UserManager!
    
    func getUser() -> User? {
        return userManager.getUser()
    }
    
    func fillUser(email: String, password: String) {
        guard let _ = getUser() else {
            userManager.createUser(email: email, password: password)
            return
        }
        userManager.updateUserCredentials(email: email, password: password)
    }
}
