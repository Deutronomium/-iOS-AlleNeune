//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct FinePayment {
    //api parameters
    static let ROOT = "fine_payment"
    static let ID = "id"
    static let PARTICIPATION_ID = "participation_id"
    static let USER_ID = "user_id"
    static let EVENT_ID = "event_id"
    static let FINE_ID = "fine_id"

    //URLs
    static let GENERIC_URL = "/fine_payments"
    static let GET_BY_USER_AND_EVENT : String = FinePayment.GENERIC_URL + "get_by_user_and_event"
}
