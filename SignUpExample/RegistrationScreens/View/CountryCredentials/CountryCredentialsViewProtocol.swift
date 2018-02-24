//
//  CountryCredentialsViewProtocol.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol CountryCredentialsViewProtocol: class {
    func showError(message: String)
    func fillCredentials(email: String, city: String?, country: String?, postalCode: Int?)
}
