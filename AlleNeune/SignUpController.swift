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
            UIHelper.changeTextFieldColor(userNameTextField, placeholderText: NSLocalizedString("ENTER_USERNAME", comment: "Enter Username"))
        }
        
        if email.isEmpty {
            UIHelper.changeTextFieldColor(emailTextField, placeholderText: NSLocalizedString("ENTER_EMAIL", comment: "Enter email"))
        }
        
        if password.isEmpty {
            UIHelper.changeTextFieldColor(passwordTextField, placeholderText: NSLocalizedString("ENTER_PASSWORD", comment: "Enter password"))
        }
        
        if password.isEmpty {
            UIHelper.changeTextFieldColor(confirmPasswordTextField, placeholderText: NSLocalizedString("ENTER_CONFIRM_PASSWORD", comment: "Enter confirmation password"))
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
                    UIHelper.changeTextFieldColor(userNameTextField, placeholderText: NSLocalizedString("USERNAME_ALREADY_USED", comment: "Username is already in use!"))
                    UIHelper.changeTextFieldColor(emailTextField, placeholderText: NSLocalizedString("EMAIL_ALREADY_USED", comment: "Email is already in use!"))
                case .NAME_USED:
                    UIHelper.changeTextFieldColor(userNameTextField, placeholderText: NSLocalizedString("USERNAME_ALREADY_USED", comment: "Username is already in use!"))
                case .EMAIL_USED:
                    UIHelper.changeTextFieldColor(emailTextField, placeholderText: NSLocalizedString("EMAIL_ALREADY_USED", comment: "Email is already in use!"))
                }
            } else {
                UIHelper.changeTextFieldColor(passwordTextField, placeholderText: NSLocalizedString("PASSWORDS_DO_NOT_MATCH", comment: "Passwords do not match"))
                UIHelper.changeTextFieldColor(confirmPasswordTextField, placeholderText: NSLocalizedString("PASSWORDS_DO_NOT_MATCH", comment: "Passwords do not match"))
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
