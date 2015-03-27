//
//  CreateDrinkViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 24/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class CreateDrinkViewController: UIViewController {
    
    let drinkService = DrinkService()

    @IBOutlet weak var drinkNameTextField: MyTextField!
    @IBOutlet weak var drinkPriceTextField: MyTextField!
    
    @IBAction func createDrinkAction(sender: AnyObject) {
        drinkNameTextField.reset()
        drinkPriceTextField.reset()
        
        var drinkName = drinkNameTextField.text
        var drinkPrice = drinkPriceTextField.text
        
        if drinkName.isEmpty {
            drinkNameTextField.error("Please enter a drink name!")
        }
        if drinkPrice.isEmpty {
            drinkPriceTextField.error("Please enter a drink price!")
        }
        if !drinkName.isEmpty && !drinkPrice.isEmpty {
            drinkService.create(drinkName, drinkPrice: drinkPrice, clubID: currentClub.id!)
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
