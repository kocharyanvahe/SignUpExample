//
//  CountryCredentialsPresenter.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol CountryCredentialsPresenter {
    func registerActionWith(city: String, country: String, postalCode: Int)
    func viewIsReady()
    func backAction()
}
