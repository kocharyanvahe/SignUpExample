//
//  API.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/19/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "poco-test.herokuapp.com"
    
    enum Endpoint {
        case login
        case registration
        
        var endpoint: String {
            switch self {
            case .login:
                return "/login"
            case .registration:
                return "/addUser"
            }
        }
    }
    
    static func createURL(endPoint: Endpoint) -> URL {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = endPoint.endpoint
        guard let url = urlComponent.url else {
            fatalError("Error with creation of url.")
        }
        return url
    }
}
