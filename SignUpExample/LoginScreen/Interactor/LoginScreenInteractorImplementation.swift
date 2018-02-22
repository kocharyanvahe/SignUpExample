//
//  LoginScreenInteractorImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/21/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

//  Currently, the usage of this class is unusefull because it's repeating the same logic which is exist on LoginService.
//  But this implementation ready for exteding in case of there should need to use multiple services.
//  This class will encapsulate the realization of their interface from Presenter and allow us easily change the interface of services.

import Foundation

final class LoginScreenInteractorImplementation: LoginScreenInteractor {
    var loginService: LoginService!
    
    func performLogin(with user: User, success: @escaping ((Bool, String?) -> ()), failure: ((RequestError) -> ())?) {
        loginService.performLogin(with: user, success: { (isSuccess, responseText) in
            success(isSuccess, responseText)
        }) { (error) in
            failure?(error)
        }
    }
}
