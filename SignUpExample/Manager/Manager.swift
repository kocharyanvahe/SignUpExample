//
//  Manager.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/19/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

class Manager: ManagerInputProtocol {
    var requestHandler: ManagerOutputProtocol?
    
    func login(with user: User) {
        print("aaa")
        print(API.loginURL)
        print(API.registrationURL)
        
    }
}
