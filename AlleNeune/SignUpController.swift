//
//  SignUpController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 06/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class SignUpController: MyViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBAction func continueAction(sender: AnyObject) {
        UIHelper.resetBorder(userNameTextField, emailTextField, passwordTextField, confirmPasswordTextField)
        
        let userService = UserService()
        
        let userName : String = userNameTextField.text
        let email : String = emailTextField.text
        let password :String = passwordTextField.text
        let confirmPassword : String = confirmPasswordTextField.text
        
        if userName.isEmpty {
            UIHelper.changeTextFieldColor(userNameTextField, placeholderText: "Please enter a username!")
        }
        
        if email.isEmpty {
            UIHelper.changeTextFieldColor(emailTextField, placeholderText: "Please enter an email!")
        }
        
        if password.isEmpty {
            UIHelper.changeTextFieldColor(passwordTextField, placeholderText: "Please enter a password")
        }
        
        if password.isEmpty {
            UIHelper.changeTextFieldColor(confirmPasswordTextField, placeholderText: "Please confirm your password")
        }
        
        if !userName.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty {
            if password == confirmPassword {
                let userValidity = userService.checkValidity(userName, email: email, password: password, passwordConfirmation: confirmPassword, phoneNumber: "")
                switch userValidity {
                case .VALID :
                    let phoneNumberViewController = PhoneNumberControler(nibName: "PhoneNumberControler", bundle: nil)
                    phoneNumberViewController.userName = userName
                    phoneNumberViewController.email = email
                    phoneNumberViewController.password = password
                    phoneNumberViewController.confirmPassword = confirmPassword
                    navigationController?.pushViewController(phoneNumberViewController, animated: true)
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
    }
    
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
