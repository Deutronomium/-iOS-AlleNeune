//
//  ViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 03/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class LoginController: MyViewController {
    
    var response = false;
    let userService = UserService()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logInAction(sender: AnyObject) {
        UIHelper.resetBorder(emailTextField, passwordTextField)
        let sessionService = SessionService()
        let email = emailTextField.text
        let password = passwordTextField.text
        let logInResponse = sessionService.logIn(email, password: password)
        if email.isEmpty {
            UIHelper.changeTextFieldColor(emailTextField, placeholderText: "You did not enter an email address!")
        }
        if password.isEmpty {
            UIHelper.changeTextFieldColor(passwordTextField, placeholderText: "You did not enter a password!")
        }
        
        if !email.isEmpty && !password.isEmpty {
            switch logInResponse {
            case .SUCCESS:
                if userService.userHasClub(currentUser.userName!) {
                    let clubHomeViewController = ClubHomeController(nibName: "ClubHomeController", bundle: nil)
                    navigationController?.pushViewController(clubHomeViewController, animated: true)
                } else {
                    let userHomeViewController = UserHomeController(nibName: "UserHomeController", bundle: nil)
                    navigationController?.pushViewController(userHomeViewController, animated: true)
                }
                
                break
            case .WRONG_EMAIL:
                UIHelper.changeTextFieldColor(emailTextField, placeholderText: "You entered a wrong email address!")
                break
            case .WRONG_PASSWORD:
                UIHelper.changeTextFieldColor(passwordTextField, placeholderText: "You entered a wrong password!")
                break
            case .BAD_REQUEST:
                println("Something went wrong by login")
                //TODO: Some error handling!
            }
        }
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        let vc = SignUpController(nibName: "SignUpController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBarHidden = false
    }
}

