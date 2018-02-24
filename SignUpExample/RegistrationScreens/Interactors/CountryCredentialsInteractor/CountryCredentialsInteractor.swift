//
//  CountryCredentialsInteractor.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol CountryCredentialsInteractor {
    func getUser() -> User?
    func fillUseraddUserMetaData(city: String, country: String, postalCode: Int)
    func performRegistration(with user: User, success: @escaping ((Bool, String?) -> ()), failure: ((RequestError) -> ())?)
}
