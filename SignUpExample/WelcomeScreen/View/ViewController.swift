//
//  ViewController.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/13/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User(email: "x@y.z", password: "abc")
        /*
        login(post: user) { (error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }*/
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
