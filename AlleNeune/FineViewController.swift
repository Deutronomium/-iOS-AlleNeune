//
//  FineViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 20/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class FineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(animated: Bool) {
        setNavigation()
    }
    
    func setNavigation() {
        let createFineButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "createFine")
        self.tabBarController?.navigationItem.rightBarButtonItem = createFineButton
        self.tabBarController?.title = "Fines"
    }
    
    func createFine() {
        performSegueWithIdentifier("createFineSegue", sender: self)
    }
}
