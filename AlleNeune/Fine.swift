//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct Fine {
    //attributes
    var id : Int?
    var name : String?
    var amount : Double?
    
    //api parameters
    static let ROOT = "fine"
    static let ROOTS = "fines"
    static let ID = "id"
    static let NAME = "name"
    static let AMOUNT = "amount"
    static let CLUB_ID = "club_id"

    //URLs
    static let GENERIC_URL = "/fines"
    static let GET_BY_CLUB : String = Fine.GENERIC_URL + "/get_by_club"
    static let UPDATE : String = Fine.GENERIC_URL + "/"
    
    init(id: Int, name: String, amount: Double) {
        self.id = id
        self.name = name
        self.amount = amount
    }
    
}
