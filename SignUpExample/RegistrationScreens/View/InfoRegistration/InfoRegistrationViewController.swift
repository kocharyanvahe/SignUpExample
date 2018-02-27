//
//  InfoRegistrationViewController.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit

class InfoRegistrationViewController: UIViewController, InfoRegistrationViewProtocol, TransitionHandler {
    
    var presenter: InfoRegistrationPresenter!
    
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var infoTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTapped(_:)))
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        presenter.nextAction()
    }
    
    @objc func backTapped(_ sender: UIBarButtonItem) {
        presenter.backAction()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
