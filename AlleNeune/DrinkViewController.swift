//
//  DrinkViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 20/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class DrinkViewController: UIViewController {

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
        let createDrinkButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "createDrink")
        self.tabBarController?.title = "Drinks"
        self.tabBarController?.navigationItem.rightBarButtonItem = createDrinkButton
    }
    
    func createDrink() {
        performSegueWithIdentifier("createDrinkSegue", sender: self)
    }
}
