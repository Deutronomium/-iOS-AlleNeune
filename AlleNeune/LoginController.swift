//
//  ViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 03/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    var response = false;
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logInAction(sender: AnyObject) {
        let sessionService = SessionService()
        let email = emailTextField.text
        let password = passwordTextField.text
        if sessionService.logIn(email, password: password) {
            let userHomeViewController : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("UserHomeController")
            self.showViewController(userHomeViewController as UIViewController, sender: userHomeViewController)
        }
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        let vc = SignUpController(nibName: "SignUpController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(User.ROOT)
        navigationController?.navigationBarHidden = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBarHidden = false
    }
}

