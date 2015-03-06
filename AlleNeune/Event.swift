//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct Event {
    //api parameters
    let ROOT = "event"
    let ID = "id"
    let NAME = "name"
    let CLUB_ID = "club_id"
    let DATE = "date"
    let EVENT_ID = "event_id"

    let GENERIC_URL = "/events"
    let GET_PARTICIPANTS : String = Event().GENERIC_URL + "/get_participants"
    let GET_BY_CLUB : String = Event().GENERIC_URL + "/get_by_club"
}
