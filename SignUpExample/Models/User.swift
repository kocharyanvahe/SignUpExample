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
    
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
