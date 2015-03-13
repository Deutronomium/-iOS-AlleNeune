//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct Event {
    //attributes
    var id : Int?
    var name : String?
    var date : String?
    
    //api parameters
    static let ROOT = "event"
    static let ID = "id"
    static let NAME = "name"
    static let CLUB_ID = "club_id"
    static let DATE = "date"
    static let EVENT_ID = "event_id"

    static let GENERIC_URL = "/events"
    static let GET_PARTICIPANTS : String = Event.GENERIC_URL + "/get_participants"
    static let GET_BY_CLUB : String = Event.GENERIC_URL + "/get_by_club"
    
    init(id : Int, name : String, date : String) {
        self.id = id
        self.name = name
        self.date = date
    }
}
