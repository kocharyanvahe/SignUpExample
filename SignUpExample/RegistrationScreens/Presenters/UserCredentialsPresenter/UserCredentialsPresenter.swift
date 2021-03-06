//
//  UserCredentialsPresenter.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/22/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol UserCredentialsPresenter {
    func nextActionWith(email: String, password: String)
    func viewIsReady()
    func backAction()
}
