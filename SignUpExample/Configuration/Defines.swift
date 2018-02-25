//
//  Defines.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

struct Defines {
    enum Messages: String {
        case NoInternetConnectionMessage = "You have no internet connection."
        case WrongCredentials = "Wrong Credentials"
        case UnknownError = "Something went wrong. Please, try again."
        case TimeOut = "Server is not reachable."
        case SuccessLoginText = "You have successfully logged in."
        case SuccessRegistrationText = "Congratulations for registering."
        case PasswordTooShort = "Password too short. Please, try again."
        case UserExist = "User already exist."
        case ErrorTitle = "ERROR!"
    }
    static let UserExist = "err.user.exists"
    static let PasswordTooShort = "err.password.too.short"
    static let TimeOut = "err.timeout"
    static let WrongCredentials = "err.wrong.credentials"
    static let SuccessResponseKey = "data"
    static let ErrorResponseKey = "error"
}
