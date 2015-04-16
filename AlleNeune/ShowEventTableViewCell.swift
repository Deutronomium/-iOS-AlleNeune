//
//  ShowEventTableViewCell.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 30/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class ShowEventTableViewCell: UITableViewCell {

    var user : User?
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    @IBAction func addFineAction(sender: AnyObject) {
        println("FineButton clicked!")
    }
    
    @IBAction func addDrinkAction(sender: AnyObject) {
        println("DrinkButton clicked!")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
