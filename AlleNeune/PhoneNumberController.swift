//
//  PhoneNumberControler.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 06/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class PhoneNumberController: MyViewController {
    let userService = UserService()
    var userName : String = ""
    var email : String = ""
    var password : String = ""
    var confirmPassword : String = ""

    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBAction func finishUserAction(sender: AnyObject) {
        let phoneNumber = phoneNumberTextField.text
        
        if userService.createUser(userName, email: email, phoneNumber: phoneNumber, password: password, confirmPassword: confirmPassword) {
            let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            appDelegate.window?.rootViewController = appDelegate.clubHomeController
        }
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBarHidden = true
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
    }
}
