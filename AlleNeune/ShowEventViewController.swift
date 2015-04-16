//
//  ShowEventViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 30/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class ShowEventViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var showEventTable: UITableView!
    
    //Variables and Constants
    //-----------------------------------------------------------------
    var users : [User] = []
    var eventService = EventService()
    var event : Event?
    
    //View functions
    //-----------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        println(event?.id);
        //TODO: Change to eventID after testing...
        users = eventService.getEventParticipants(1);
        
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
        let user = users[indexPath.row]
        println("Setting user for cell")
        cell.user = user
        cell.userNameLabel.text = user.userName
        
        return cell
    }
}
