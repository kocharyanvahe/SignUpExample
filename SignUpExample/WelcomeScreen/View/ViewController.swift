//
//  ViewController.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/13/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WelcomeScreenViewProtocol, TransitionHandler {
    
    var presenter: WelcomeScreenPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
