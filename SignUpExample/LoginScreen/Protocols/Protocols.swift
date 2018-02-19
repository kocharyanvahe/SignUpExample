//
//  Protocols.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/19/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation

protocol ManagerInputProtocol: class {
    // INTERACTOR -> MANAGER
    var requestHandler: ManagerOutputProtocol? { get set }
    func login(with user: User)
}

protocol ManagerOutputProtocol: class {
    // MANAGER -> INTERACTOR
    func successfullyLoggedIn(_ response: Dictionary<String, Any>)
    func failed()
}

protocol ManagerInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func successfullyLoggedIn(_ response: Dictionary<String, Any>)
    func failed()
}

protocol ManagerInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ManagerInteractorOutputProtocol? { get set }
    var manager: ManagerInputProtocol? { get set }
    func login(with user: User)
}
