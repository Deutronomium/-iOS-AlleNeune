//
//  CreateFineViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 27/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class CreateFineViewController: UIViewController {
    //Defines
    //-----------------------------------------------------------------
    let fineService = FineService()

    //Outlets
    //-----------------------------------------------------------------
    @IBOutlet weak var fineAmountTextField: MyTextField!
    @IBOutlet weak var fineNameTextField: MyTextField!
    
    //Actions
    //-----------------------------------------------------------------
    @IBAction func createFineAction(sender: AnyObject) {
        fineNameTextField.reset()
        fineAmountTextField.reset()
        
        var fineName = fineNameTextField.text
        var fineAmount = fineAmountTextField.text
        
        if fineAmount.isEmpty {
            fineAmountTextField.error("Please enter a fine amount!")
        }
        if fineName.isEmpty {
            fineNameTextField.error("Please enter a fine name!")
        }
        if !fineName.isEmpty && !fineAmount.isEmpty {
            fineService.create(fineName, fineAmount: fineAmount, clubID: currentClub.id!)
            navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
    //View Functions
    //-----------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
