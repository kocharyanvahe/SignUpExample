//
//  ViewController.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/13/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WelcomeScreenViewInputProtocol, TransitionHandler {
    
    var presenter: WelcomeScreenPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let manager = Manager() //Qwerty1234
        //let user = User(email: "a@abcd.com", password: "Qwerty1234", country: "ET", city: "Tallinn", postal_code: 10111)
        //manager.registration(with: user)
        //let user = User(email: "a@abcd.com", password: "Qwerty1234")
        //manager.login(with: user)
        
//        let networkService = NetworkRequestImplementation()
//        let user = User(email: "a@abcd.com", password: "Qwerty1234", country: "ET", city: "Tallinn", postal_code: 10111)
        
//        networkService.request(with: user, url: API.createURL(endPoint: .registration), success: { success in
//            print("success :\(success)")
//        }) { (_) in
//            print("fail")
//        }
        
//        networkService.request(with: user, url: API.createURL(endPoint: .registration), success: { (isSuccess, resultString) in
//            print("\(isSuccess), \(resultString ?? "no result")")
//        }) { (_) in
//            print("faaaail")
//        }
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        presenter.loginAction()
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        presenter.registerAction()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
