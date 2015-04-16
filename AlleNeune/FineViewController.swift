//
//  FineViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 20/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class FineViewController: UIViewController {

    //Outlets
    //-----------------------------------------------------------------
    @IBOutlet weak var fineTable: UITableView!
    let fineService = FineService()
    var items : [Fine] = []
    
    //Actions
    //-----------------------------------------------------------------
    @IBAction func createFineAction(sender: AnyObject) {
        performSegueWithIdentifier(SegueNames.CREATE_FINE.rawValue, sender: self)
    }
    
    //View Functions
    //-----------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        items = fineService.getByClub(currentClub.id!)
        fineTable.rowHeight = 60
        //setNavigation()
        fineTable.registerNib(UINib(nibName: XIBNames.FINE_CELL.rawValue, bundle: nil), forCellReuseIdentifier: CustomCellNames.FINE_CELL.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        items = fineService.getByClub(currentClub.id!)
        fineTable.reloadData()
    }
    
    //Table Functions
    //-----------------------------------------------------------------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomCellNames.FINE_CELL.rawValue, forIndexPath: indexPath) as FineTableViewCell
        
        let fine : Fine = items[indexPath.row]
        
        cell.nameLabel.text = fine.name
        cell.amountLabel.text = String(format:"%.2f", fine.amount!)
        
        return cell
    }
    
}
