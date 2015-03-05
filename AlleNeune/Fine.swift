//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct Fine {
    //api parameters
    let ROOT = "fine"
    let ID = "id"
    let NAME = "name"
    let AMOUNT = "amount"
    let CLUB_ID = "club_id"

    //URLs
    let GENERIC_URL = "/fines"
    let GET_BY_CLUB = GENERIC_URL + "/get_by_club"
    let UPDATE = GENERIC_URL + "/"
}
