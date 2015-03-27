//
//  SignUpController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 06/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class SignUpController: MyViewController {

    @IBOutlet weak var userNameTextField: MyTextField!
    @IBOutlet weak var emailTextField: MyTextField!
    @IBOutlet weak var passwordTextField: MyTextField!
    @IBOutlet weak var confirmPasswordTextField: MyTextField!

    let userService = UserService()
    @IBAction func continueAction(sender: AnyObject) {
        
    }
    @IBOutlet weak var signUpButton: UIBarButtonItem!

    
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationBarHidden = true
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "phoneNumberSegue" {
            if continueToPhoneNumber() {
                return true
            }
        }
        
        return false
    }
    
    func continueToPhoneNumber()  -> Bool {
        userNameTextField.reset()
        emailTextField.reset()
        passwordTextField.reset()
        confirmPasswordTextField.reset()
        
        let userName : String = userNameTextField.text
        let email : String = emailTextField.text
        let password :String = passwordTextField.text
        let confirmPassword : String = confirmPasswordTextField.text
        var cont = false
        
        if userName.isEmpty {
            userNameTextField.error(NSLocalizedString("ENTER_USERNAME", comment: "Enter Username"))
        }
        
        if email.isEmpty {
            emailTextField.error(NSLocalizedString("ENTER_EMAIL", comment: "Enter email"))
        }
        
        if password.isEmpty {
            passwordTextField.error(NSLocalizedString("ENTER_PASSWORD", comment: "Enter password"))
        }
        
        if confirmPassword.isEmpty {
            confirmPasswordTextField.error(NSLocalizedString("ENTER_CONFIRM_PASSWORD", comment: "Enter confirmation password"))
        }
        
        if !userName.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty {
            if password == confirmPassword {
                let userValidity = userService.checkValidity(userName, email: email, password: password, passwordConfirmation: confirmPassword, phoneNumber: "")
                switch userValidity {
                case .VALID :
                    //phoneNumberViewController.userName = userName
                    //phoneNumberViewController.email = email
                    //phoneNumberViewController.password = password
                    //phoneNumberViewController.confirmPassword = confirmPassword
                    cont = true
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
        
        return cont
    }
}
