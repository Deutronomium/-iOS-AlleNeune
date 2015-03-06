//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct DrinkPayment {
    //api parameters
    let ROOT : String = "drink_payment"
    let ID : String = "id"
    let PARTICIPATION_ID = "participation_id"
    let USER_ID = "user_id"
    let EVENT_ID = "event_id"
    let DRINK_ID = "drink_id"
    let TOTAL_PRICE = "total_price"

    //URLs
    let GENERIC_URL = "/drink_payments"
    let GET_BY_USER_AND_EVENT : String = DrinkPayment().GENERIC_URL + "/get_by_user_and_event"
    let TOTAL_BY_USER_AND_EVENT : String = DrinkPayment().GENERIC_URL + "total_by_user_and_event"
}
