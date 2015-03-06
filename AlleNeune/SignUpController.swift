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
        let userService = UserService()
        
        let userName = userNameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        let userValidity = userService.checkValidity(userName, email: email, password: password, passwordConfirmation: confirmPassword, phoneNumber: "")
        switch userValidity {
            case .VALID :
                println("Valid")
            case .NAME_AND_EMAIL_USED:
                println("user and email")
            case .NAME_USED:
                println("user")
            case .EMAIL_USED:
                println("email")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
