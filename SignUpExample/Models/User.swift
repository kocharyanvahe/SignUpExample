//
//  User.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/19/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

struct User: Codable {
    var email: String
    var password: String
    var country: String? = nil
    var city: String? = nil
    var postal_code: Int? = nil
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    init(email: String, password: String, country: String, city: String, postal_code: Int) {
        self.email = email
        self.password = password
        self.country = country
        self.city = city
        self.postal_code = postal_code
    }
}
