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
    var items : [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = eventService.getEventsByClub(currentClub.id!)
        eventsTable.rowHeight = 60
        setNavigation()
        eventsTable.registerNib(UINib(nibName: XIBNames.EVENT_CELL.rawValue, bundle: nil), forCellReuseIdentifier: CustomCellNames.EVENT_CELL.rawValue)
    }
    
    func createEvent() {
        performSegueWithIdentifier("createEventSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        setNavigation()
    }
    
    override func viewWillAppear(animated: Bool) {
        items = eventService.getEventsByClub(currentClub.id!)
        eventsTable.reloadData()
    }
    
    func setNavigation() {
        let createEventBarButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "createEvent")
        self.tabBarController?.title = "Events"
        self.tabBarController?.navigationItem.rightBarButtonItem = createEventBarButton
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomCellNames.EVENT_CELL.rawValue, forIndexPath: indexPath) as EventTableViewCell
        
        let event = items[indexPath.row]
        
        //cell.contentView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        cell.eventNameLabel.text = event.name
        var date : String = event.date!
        var dateArr = date.componentsSeparatedByString(".")
        cell.eventDateLabel.text = dateArr[0]
        
        return cell
    }
}
