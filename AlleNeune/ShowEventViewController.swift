//
//  ShowEventViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 30/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class ShowEventViewController: UIViewController, UITableViewDelegate {
    //Outlets
    //-----------------------------------------------------------------
    @IBOutlet weak var showEventTable: UITableView!
    
    //Variables and Constants
    //-----------------------------------------------------------------
    var users : [User] = []
    var eventService = EventService()
    var event : Event?
    var selectedUser : User?
    
    //View functions
    //-----------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        users = eventService.getEventParticipants(event!.id!);
        
        self.navigationItem.title = event?.name
        showEventTable.registerNib(UINib(nibName: XIBNames.SHOW_EVENT_CELL.rawValue, bundle: nil), forCellReuseIdentifier: CustomCellNames.SHOW_EVENT_CELL.rawValue)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationItem.title = event?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Table functions
    //-----------------------------------------------------------------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomCellNames.SHOW_EVENT_CELL.rawValue, forIndexPath: indexPath) as ShowEventTableViewCell
        
        //showEventViewCell
        selectedUser = users[indexPath.row]
        
        cell.userNameLabel.text = selectedUser?.userName
        cell.addDrinkAction = {
            self.performSegueWithIdentifier(SegueNames.ADD_DRINK_TO_USER.rawValue, sender: self)
        }
        cell.addFineAction = {
            self.performSegueWithIdentifier(SegueNames.ADD_FINE_TO_USER.rawValue, sender: self)
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let addDrinkToUserViewController = segue.destinationViewController as? AddDrinkToUserViewController {
            addDrinkToUserViewController.user = selectedUser
        }
    }
    

}
