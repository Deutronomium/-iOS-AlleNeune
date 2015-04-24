//
//  AddDrinkToUserCell.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 16/04/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class AddDrinkToUserCell: UITableViewCell {
    
    //Outlets
    //-------------------------------------------------------------
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var drinkAmountStepper: UIStepper!
    @IBOutlet weak var drinkAmountLabel: UILabel!
    
    //Variables
    //-------------------------------------------------------------
    var addDrinkToUserAction:() -> () = {}
    
    //Actions
    //-------------------------------------------------------------
    @IBAction func addDrinkToUserAction(sender: AnyObject) {
        if addDrinkToUserAction != nil {
            addDrinkToUserAction()
        }
    }
    
    @IBAction func increaseAmount(sender: UIStepper) {
        drinkAmountLabel.text = Int(sender.value).description
    }

    
    //View functions
    //-------------------------------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
    
        //if set to true starts at min value after reaching max value
        drinkAmountStepper.wraps = false
        //enables user to hold and increase continually
        drinkAmountStepper.autorepeat = true
        
        drinkAmountStepper.maximumValue = 10
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
