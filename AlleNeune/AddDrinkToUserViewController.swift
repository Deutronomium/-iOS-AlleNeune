//
//  AddDrinkToUserController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 16/04/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class AddDrinkToUserViewController: UIViewController, UITableViewDelegate {
    //Outlets
    //-----------------------------------------------------------------
    @IBOutlet weak var table: UITableView!
    
    //Variables
    //-----------------------------------------------------------------
    var drinks : [Drink] = []
    var user : User?
    var drinkService : DrinkService = DrinkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinks = drinkService.getByClub(currentClub.id!)
        table.registerNib(UINib(nibName: XIBNames.ADD_DRINK_TO_USER_CELL.rawValue, bundle: nil), forCellReuseIdentifier: CustomCellNames.ADD_DRINK_TO_USER_CELL.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //TableFunctions
    //-----------------------------------------------------------------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return drinks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomCellNames.ADD_DRINK_TO_USER_CELL.rawValue, forIndexPath: indexPath) as AddDrinkToUserCell
        
        let drink = drinks[indexPath.row]
        cell.drinkNameLabel.text = drink.name
        cell.addDrinkToUserAction = {
            
        }
        
        return cell
    }

    
}
