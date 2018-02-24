//
//  CountryCredentialsInteractorImplementation.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

final class CountryCredentialsInteractorImplementation: CountryCredentialsInteractor {
    
    var registrationService: RegistrationService!
    var userManager: UserManager!
    
    func getUser() -> User? {
        return userManager.getUser()
    }
    
    func fillUseraddUserMetaData(city: String, country: String, postalCode: Int) {
        
        userManager.addUserMetaData(city: city, country: country, postalCode: postalCode)
    }
    
    func performRegistration(with user: User, success: @escaping ((Bool, String?) -> ()), failure: ((RequestError) -> ())?) {
        registrationService.performRegistration(with: user, success: { (isSuccess, responseText) in
            success(isSuccess, responseText)
        }) { (error) in
            failure?(error)
        }
    }
    

}
