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
    func success<R: Decodable>(result: R)
    func failed()
    func failedWithReason(_ errorMessage: String)
}

protocol ManagerInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func success()
    func failed()
    func failedWithReason(_ errorMessage: String)
}

protocol ManagerInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ManagerInteractorOutputProtocol? { get set }
    var manager: ManagerInputProtocol? { get set }
    func login(with user: User)
}
