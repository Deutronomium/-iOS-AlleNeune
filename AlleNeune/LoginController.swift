//
//  ViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 03/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class LoginController: MyViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var response = false;
    let userService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        let userService = UserService()
        var loginResponse = login()
        if identifier == "clubHomeSegue" {
            if loginResponse {
                userService.userHasClub(currentUser.userName!)
                return true
            }
        } else if identifier == "signUpSegue" {
            return true
        }
        
        return false
    }
    
    func login() -> Bool {
        UIHelper.resetBorder(emailTextField, passwordTextField)
        let sessionService = SessionService()
        let email = emailTextField.text
        let password = passwordTextField.text
        var cont = false
        
        if email.isEmpty {
            UIHelper.changeTextFieldColor(emailTextField, placeholderText: NSLocalizedString("ENTER_EMAIL", comment: "Enter email"))
        }
        if password.isEmpty {
            UIHelper.changeTextFieldColor(passwordTextField, placeholderText: NSLocalizedString("ENTER_PASSWORD", comment: "Enter password"))
        }
        
        if !email.isEmpty && !password.isEmpty {
            let logInResponse = sessionService.logIn(email, password: password)
            println(logInResponse)
            switch logInResponse {
            case .SUCCESS:
                cont = true
                break
            case .WRONG_EMAIL:
                UIHelper.changeTextFieldColor(emailTextField, placeholderText: NSLocalizedString("WRONG_EMAIL", comment: "User entered a wrong email!"))
                break
            case .WRONG_PASSWORD:
                UIHelper.changeTextFieldColor(passwordTextField, placeholderText: NSLocalizedString("WRONG_PASSWORD", comment: "User entered a wrong password!"))
                break
            case .BAD_REQUEST:
                println("Something went wrong by login")
                //TODO: Some error handling!
            }
        }
        
        return cont
    }
    
}

