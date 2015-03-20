//
//  EventViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 19/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var eventsTable: UITableView!
    let eventService = EventService()
    var items : [Event] = [Event(id: 1, name: "FirstName", date: "FirstDate"), Event(id: 1, name: "SecondName", date: "SecondDate")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventService.getEventsByClub(currentClub.id!)
        self.tabBarController?.title = "Events"
        eventsTable.registerNib(UINib(nibName: XIBNames.EVENT_CELL.rawValue, bundle: nil), forCellReuseIdentifier: CustomCellNames.EVENT_CELL.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tabBarController?.title = "Events"
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomCellNames.EVENT_CELL.rawValue, forIndexPath: indexPath) as EventTableViewCell
        
        let event = items[indexPath.row]
        
        //cell.contentView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        cell.eventNameLabel.text = event.name
        cell.eventDateLabel.text = event.date
        
        return cell
    }
}
