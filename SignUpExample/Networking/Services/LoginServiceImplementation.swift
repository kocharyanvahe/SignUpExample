//
//  LoginServiceImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class LoginServiceImplementation: LoginService {
    
    var networkRequest: NetworkRequest!
    
    func performLogin(with user: User, success: @escaping ((Bool, String?) -> ()), failure: ((RequestError) -> ())?) {
        let url = API.createURL(endPoint: .login)
        networkRequest.request(with: user, url: url, success: { (isSuccess, responseText) in
            success(isSuccess, responseText)
        }) { (error) in
            failure?(error)
        }
    }
}
