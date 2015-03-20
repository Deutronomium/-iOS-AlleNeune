//
//  CreateEventViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 20/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {

    let eventService = EventService()
    
    @IBOutlet weak var eventName: MyTextField!
    @IBOutlet weak var eventDateOutlet: UIDatePicker!
    
    @IBAction func createEventAction(sender: AnyObject) {
        eventName.reset()
        var eventNameString = eventName.text
        var eventDate = eventDateOutlet.date
        
        if eventNameString.isEmpty {
            eventName.error("Please enter an event name!")
        } else {
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            println(dateFormatter.stringFromDate(eventDate))
            
            eventService.create(eventNameString, eventDate: dateFormatter.stringFromDate(eventDate), clubID: currentClub.id!)
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
