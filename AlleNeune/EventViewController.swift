//
//  EventViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 10/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventsTable: UITableView!
    let eventService = EventService()
    var items : [Event] = [Event(id: 1, name: "FirstName", date: "FirstDate"), Event(id: 1, name: "SecondName", date: "SecondDate")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        eventsTable.delegate = self
        eventsTable.dataSource = self
        
        eventsTable.registerNib(UINib(nibName: XIBNames.EVENT_CELL.rawValue, bundle: nil), forCellReuseIdentifier: CustomCellNames.EVENT_CELL.rawValue)
    }
    
    override func viewDidAppear(animated: Bool) {
        var events = eventService.getEventsByClub(currentClub.id!)
        eventsTable.delegate? = self
        eventsTable.dataSource? = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
