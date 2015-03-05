//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct Drink {
    //api parameters
    let ROOT : String = "drink"
    let ID : String = "id"
    let CLUB_ID : String = "club_id"
    let NAME : String = "name"
    let PRICE : String = "price"

    //URLs
    let GENERIC_URL : String = "/drinks"
    let GET_BY_CLUB = GENERIC_URL + "/get_by_club"
    let UPDATE = GENERIC_URL + "/"
}
