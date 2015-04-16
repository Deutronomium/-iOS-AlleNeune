//
//  EventViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 19/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UITableViewDelegate {

    //Outlets
    //-----------------------------------------------------------------
    @IBOutlet weak var eventsTable: UITableView!

    //Variables and Constants
    //-----------------------------------------------------------------
    let eventService = EventService()
    var items : [Event] = []
    var selectedEvent : Event?

    //Actions
    //-----------------------------------------------------------------
    @IBAction func createEventAction(sender: AnyObject) {
        performSegueWithIdentifier(SegueNames.CREATE_EVENT.rawValue, sender: self)
    }
    
    //View functions
    //-----------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        items = eventService.getEventsByClub(currentClub.id!)
        eventsTable.rowHeight = 60
        self.navigationController?.navigationBarHidden = false
        //setNavigation()
        eventsTable.registerNib(UINib(nibName: XIBNames.EVENT_CELL.rawValue, bundle: nil), forCellReuseIdentifier: CustomCellNames.EVENT_CELL.rawValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        items = eventService.getEventsByClub(currentClub.id!)
        eventsTable.reloadData()
    }
    
    
    //Table functions
    //-----------------------------------------------------------------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomCellNames.EVENT_CELL.rawValue, forIndexPath: indexPath) as EventTableViewCell
        
        let event = items[indexPath.row]
        
        cell.eventNameLabel.text = event.name
        var date : String = event.date!
        var dateArr = date.componentsSeparatedByString(".")
        cell.eventDateLabel.text = dateArr[0]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let event = items[indexPath.row]
        selectedEvent = event
        performSegueWithIdentifier(SegueNames.SHOW_EVENT.rawValue, sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let showEventViewController = segue.destinationViewController as? ShowEventViewController {
            showEventViewController.event = selectedEvent
        }
    }
    
}
