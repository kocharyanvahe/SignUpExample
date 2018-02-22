//
//  ErrorHandling.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case WrongCredentials
    case PasswordTooShort
    case NoInternetConnection
    case UserAlreadyExist
    case TimeOut
    case UnknownError
    
    static func checkError(_ errorMessage: String?, errorCode: Int) -> RequestError {
        switch errorCode {
        case -1009, -1005:
            return RequestError.NoInternetConnection
        case 400:
            switch errorMessage {
            case Defines.UserExist?:
                return RequestError.UserAlreadyExist
            case Defines.PasswordTooShort?:
                return RequestError.PasswordTooShort
            case Defines.WrongCredentials?:
                return RequestError.WrongCredentials
            default:
                return RequestError.UnknownError
        }
        case 408:
            if errorMessage == Defines.TimeOut {
                return RequestError.TimeOut
            } else {
                return RequestError.UnknownError
            }
        default:
            return RequestError.UnknownError
        }
    }
}
