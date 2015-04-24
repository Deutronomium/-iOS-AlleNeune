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
    var addDrinkAction:() -> () = {}
    var addFineAction:() -> () = {}
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    @IBAction func addFineAction(sender: AnyObject) {
        if addFineAction != nil {
            addFineAction()
        }
    }
    
    @IBAction func addDrinkAction(sender: AnyObject) {
        if addDrinkAction != nil {
            addDrinkAction()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
