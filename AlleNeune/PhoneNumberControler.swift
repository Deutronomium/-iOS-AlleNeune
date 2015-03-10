//
//  PhoneNumberControler.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 06/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class PhoneNumberControler: UIViewController {
    let userService = UserService()
    var userName : String = ""
    var email : String = ""
    var password : String = ""
    var confirmPassword : String = ""

    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBAction func finishUserAction(sender: AnyObject) {
        let phoneNumber = phoneNumberTextField.text
        
        if userService.createUser(userName, email: email, phoneNumber: phoneNumber, password: password, confirmPassword: confirmPassword) {
            let clubHomeController = ClubHomeController(nibName: "clubHomeController", bundle: nil)
            navigationController?.pushViewController(clubHomeController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBarHidden = true
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
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
