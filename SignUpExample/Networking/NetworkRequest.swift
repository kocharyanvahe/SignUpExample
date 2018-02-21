//
//  NetworkRequest.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol NetworkRequest {
    func request(with user: User, url: URL, success: @escaping ((Bool) -> ()), failure: ((RequestError) -> ())?)
}
