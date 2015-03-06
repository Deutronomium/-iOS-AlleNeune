//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct DrinkPayment {
    //api parameters
    static let ROOT : String = "drink_payment"
    static let ID : String = "id"
    static let PARTICIPATION_ID = "participation_id"
    static let USER_ID = "user_id"
    static let EVENT_ID = "event_id"
    static let DRINK_ID = "drink_id"
    static let TOTAL_PRICE = "total_price"

    //URLs
    static let GENERIC_URL = "/drink_payments"
    static let GET_BY_USER_AND_EVENT : String = DrinkPayment.GENERIC_URL + "/get_by_user_and_event"
    static let TOTAL_BY_USER_AND_EVENT : String = DrinkPayment.GENERIC_URL + "total_by_user_and_event"
}
