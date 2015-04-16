//
//  DrinkViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 20/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class DrinkViewController: UIViewController, UITableViewDelegate {

    //Outlets
    //-----------------------------------------------------------------
    @IBOutlet weak var drinkTable: UITableView!
    let drinkService = DrinkService()
    var items : [Drink] = []

    //Actions
    //-----------------------------------------------------------------
    @IBAction func createDrinkAction(sender: AnyObject) {
        performSegueWithIdentifier(SegueNames.CREATE_DRINK.rawValue, sender: self)
    }
    
    //View functions
    //-----------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        items = drinkService.getByClub(currentClub.id!)
        drinkTable.rowHeight = 60
        self.navigationController?.navigationBarHidden = false
        //setNavigation()
        drinkTable.registerNib(UINib(nibName: XIBNames.DRINK_CELL.rawValue, bundle: nil),forCellReuseIdentifier: CustomCellNames.DRINK_CELL.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        items = drinkService.getByClub(currentClub.id!)
        drinkTable.reloadData()
    }
    
    //Table functions
    //-----------------------------------------------------------------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomCellNames.DRINK_CELL.rawValue, forIndexPath: indexPath) as DrinkTableViewCell
        
        let drink : Drink = items[indexPath.row]
        
        cell.nameLabel.text = drink.name
        cell.priceLabel.text = String(format:"%.2f", drink.price!)
        
        return cell
    }
}
