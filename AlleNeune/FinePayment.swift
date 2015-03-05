//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct FinePayment {
    //api parameters
    let ROOT = "fine_payment"
    let ID = "id"
    let PARTICIPATION_ID = "participation_id"
    let USER_ID = "user_id"
    let EVENT_ID = "event_id"
    let FINE_ID = "fine_id"

    //URLs
    let GENERIC_URL = "/fine_payments"
    let GET_BY_USER_AND_EVENT = GENERIC_URL + "get_by_user_and_event"
}
