//
//  API.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/19/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

let scheme: String = "https"
let host: String = "poco-test.herokuapp.com"

struct API {
    static var urlComponent = URLComponents() {
        didSet {
            urlComponent.scheme = scheme
            urlComponent.host = host
        }
    }
    
    static var loginURL: URL {
        urlComponent.path = "/login"
        guard let url = urlComponent.url else { fatalError("Error with creation of url") }
        return url
    }
    
    static var registrationURL: URL {
        urlComponent.path = "/addUser"
        guard let url = urlComponent.url else { fatalError("Error with creation of url") }
        return url
    }
}
