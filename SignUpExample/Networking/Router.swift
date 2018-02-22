//
//  Router.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case post(url: URL, params: [String: Any])
    func asURLRequest() throws -> URLRequest {
        let params: ([String: Any]?) = {
            switch self {
            case .post(_, let params):
                return (params)
            }
        }()
        
        let url: URL = {
            switch self {
            case .post(let url, _):
                return (url)
            }
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}
