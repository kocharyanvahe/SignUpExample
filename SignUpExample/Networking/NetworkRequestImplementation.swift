//
//  NetworkRequestImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkRequestImplementation: NetworkRequest {
    
    func request(with user: User, url: URL, success: @escaping ((Bool, String?) -> ()), failure: ((RequestError) -> ())?)
    {
        guard let userParams = user.toDictionary else {
            success(false, nil)
            failure?(RequestError.UnknownError)
            return
        }
        Alamofire.request(Router.post(url: url, params: userParams)).responseJSON { responseJSON in
            guard let statusCode = responseJSON.response?.statusCode else {
                success(false, nil)
                failure?(RequestError.UnknownError)
                return
            }
            switch responseJSON.result {
            case .success(let json):
                let response = json as! NSDictionary
                switch statusCode {
                case 200:
                    let successText = response[Defines.SuccessResponseKey] as? String
                    success(true, successText)
                default:
                    let errorText = response[Defines.ErrorResponseKey] as? String
                    success(false, errorText)
                    failure?(RequestError.checkError(nil, errorCode: statusCode))
                }
            case .failure(_):
                success(false, nil)
                failure?(RequestError.checkError(nil, errorCode: statusCode))
            }
        }
    }
}
