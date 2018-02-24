//
//  SuccessViewController.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController, SuccessViewProtocol, ModuleConfigurableProvider {
    var configurable: ModuleConfigurable?
    var presenter: SuccessScreenPresenter!

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        guard let configurable = configurable as? SuccessfullScreenConfigurable,
            let configuration = configurable.config as? SuccessScreenSetupConfiguration,
            let config = configuration.config else {
            return
        }
        switch config {
        case .SuccessLogin:
            resultLabel.text = Defines.Messages.SuccessLoginText.rawValue
        case .SuccessRegistration:
            resultLabel.text = Defines.Messages.SuccessRegistrationText.rawValue
        }
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
