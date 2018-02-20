//
//  Storyboard.swift
//  SignUpExample
//
//  Created by Kocharyan, Vahe on 2/20/18.
//  Copyright © 2018 Kocharyan, Vahe. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardSceneType {
    static var storyboardName: String { get }
}

extension StoryboardSceneType {
    static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: nil)
    }
    
    static func initialViewController() -> UIViewController {
        guard let vc = storyboard().instantiateInitialViewController() else {
            fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
        }
        return vc
    }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
    func viewController() -> UIViewController {
        return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
    }
    static func viewController(identifier: Self) -> UIViewController {
        return identifier.viewController()
    }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
    func perform<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
        performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
}

struct Storyboard {
    
    enum Welcome: String, StoryboardSceneType {
        static let storyboardName = "WelcomeScreen"
        
        case welcomeViewControllerScene = "ViewController"
        static func instantiateWelcomeViewController() -> ViewController {
            guard let vc = Storyboard.Welcome.welcomeViewControllerScene.viewController() as? ViewController else {
                fatalError("ViewController 'ViewController' is not of the expected class ViewController.")
            }
            return vc
        }
    }
    
    enum Login: String, StoryboardSceneType {
        static let storyboardName = "LoginScreen"
        
        case loginViewControllerScene = "LoginView"
        static func instantiateLoginViewController() -> LoginView {
            guard let vc = Storyboard.Login.loginViewControllerScene.viewController() as? LoginView else {
                fatalError("ViewController 'LoginView' is not of the expected class LoginView.")
            }
            return vc
        }
    }
    
    enum Success: String, StoryboardSceneType {
        static let storyboardName = "SuccessScreen"
        
        case successViewControllerScene = "SuccessViewController"
        static func instantiateLoginViewController() -> SuccessViewController {
            guard let vc = Storyboard.Success.successViewControllerScene.viewController() as? SuccessViewController else
            {
                fatalError("ViewController 'SuccessViewController' is not of the expected class SuccessViewController.")
            }
            return vc
        }
    }
    
    enum Registration: String, StoryboardSceneType {
        static let storyboardName = "RegistrationScreen"
        
        static func initialViewController() -> UINavigationController {
            guard let vc = storyboard().instantiateInitialViewController() as? UINavigationController else {
                fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
            }
            return vc
        }
        
        case infoRegistrationViewControllerScene = "InfoRegistrationViewController"
        static func instantiateInfoRegistrationViewController() -> InfoRegistrationViewController {
            guard let vc = Storyboard.Registration.infoRegistrationViewControllerScene.viewController() as? InfoRegistrationViewController  else {
                fatalError("ViewController 'InfoRegistrationViewController' is not of the expected class InfoRegistrationViewController.")
            }
            return vc
        }
        
        case userCredentialsViewControllerScene = "UserCredentialsViewController"
        static func instantiateUserCredentialsViewController() -> UserCredentialsViewController {
            guard let vc = Storyboard.Registration.userCredentialsViewControllerScene.viewController() as? UserCredentialsViewController else {
                    fatalError("ViewController 'UserCredentialsViewController' is not of the expected class UserCredentialsViewController.")
                }
            return vc
        }
        
        case countryCredentialsViewControllerScene = "CountryCredentialsViewController"
        static func instantiateCountryCredentialsViewController() -> CountryCredentialsViewController {
            guard let vc = Storyboard.Registration.countryCredentialsViewControllerScene.viewController() as? CountryCredentialsViewController else {
                    fatalError("ViewController 'CountryCredentialsViewController' is not of the expected class CountryCredentialsViewController.")
                }
            return vc
        }
    }
}
