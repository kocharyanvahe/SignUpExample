//
//  Manager.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/19/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation
import Alamofire

class Manager: ManagerInputProtocol {
    var requestHandler: ManagerOutputProtocol?
    
    let loginEndPoint: API.Endpoint = .login
    let registrationEndPoint: API.Endpoint = .registration
    
    func login(with user: User) {
        let url: URL = API.createURL(endPoint: loginEndPoint)
        request(with: user, andURL: url, result: User.self)
    }
    
    func registration(with user: User) {
        let url: URL = API.createURL(endPoint: registrationEndPoint)
        request(with: user, andURL: url, result: User.self)
    }
    
    func request<T: Encodable, R: Decodable>(with object: T, andURL url: URL, result type: R.Type) {
        let parameters: [String: Any] = try! JSONSerialization.jsonObject(with: JSONEncoder().encode(object), options: []) as! [String: Any]
        let headers = Alamofire.SessionManager.defaultHTTPHeaders
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseData { (response) -> Void in
            guard let statusCode = response.response?.statusCode else {
                return
            }
            switch response.result {
            case .success(let resp):
                if statusCode == 200 {
                    let result = try? JSONDecoder().decode(type, from: resp)
                    self.requestHandler?.success(result: result)
                } else {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: resp, options: []) as? [String: Any] {
                            if let errorMessage = json["error"] as? String {
                                self.requestHandler?.failedWithReason(errorMessage)
                            } else {
                                
                            }
                        } else {
                            
                        }
                    } catch {
                        
                    }
                }
            case .failure(_):
                self.requestHandler?.failed()
            }
        }
    }
}
