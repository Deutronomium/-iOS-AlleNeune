//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct Drink {
    //api parameters
    static let ROOT : String = "drink"
    static let ID : String = "id"
    static let CLUB_ID : String = "club_id"
    static let NAME : String = "name"
    static let PRICE : String = "price"

    //URLs
    static let GENERIC_URL : String = "/drinks"
    static let GET_BY_CLUB : String = Drink.GENERIC_URL + "/get_by_club"
    static let UPDATE : String = Drink.GENERIC_URL + "/"
}
