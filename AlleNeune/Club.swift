//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct Club {
    //api string parameters
    let ROOT : String = "club"
    let NAME : String = "name"
    let ID : String = "id"
    let MEMBERS : String = "members"

    //URLs
    let GENERIC_URL : String = "/clubs"
    let VALIDITY : String = Club().GENERIC_URL + "/validity"
    let GET_MEMBERS_BY_CLUB : String = Club().GENERIC_URL + "get_members_by_club"
    let ADD_MEMBERS : String = Club().GENERIC_URL + "/add_members"
}
