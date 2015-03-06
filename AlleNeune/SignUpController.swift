//
//  SignUpController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 06/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBAction func continueAction(sender: AnyObject) {
        UIHelper.resetBorder(userNameTextField, emailTextField, passwordTextField, confirmPasswordTextField)
        
        let userService = UserService()
        
        let userName = userNameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        if password == confirmPassword {
            let userValidity = userService.checkValidity(userName, email: email, password: password, passwordConfirmation: confirmPassword, phoneNumber: "")
            switch userValidity {
            case .VALID :
                //TODO: Move to phoneNumberView
                println("valid")
            case .NAME_AND_EMAIL_USED:
                UIHelper.changeTextFieldColor(userNameTextField, placeholderText: "Username already in use!")
                UIHelper.changeTextFieldColor(emailTextField, placeholderText: "Email already in use!")
            case .NAME_USED:
                UIHelper.changeTextFieldColor(userNameTextField, placeholderText: "Username already in use!")
            case .EMAIL_USED:
                UIHelper.changeTextFieldColor(emailTextField, placeholderText: "Email already in use!")
            }
        } else {
            UIHelper.changeTextFieldColor(passwordTextField, placeholderText: "Passwords do not match!")
            UIHelper.changeTextFieldColor(confirmPasswordTextField, placeholderText: "Passwords do not match!")
        }
    }
    
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
