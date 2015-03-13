//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct Club {
    //attributes
    var id : Int?
    var name : String?
    
    //api string parameters
    static let ROOT : String = "club"
    static let NAME : String = "name"
    static let ID : String = "id"
    static let MEMBERS : String = "members"

    //URLs
    static let GENERIC_URL : String = "/clubs"
    static let VALIDITY : String = Club.GENERIC_URL + "/validity"
    static let GET_MEMBERS_BY_CLUB : String = Club.GENERIC_URL + "get_members_by_club"
    static let ADD_MEMBERS : String = Club.GENERIC_URL + "/add_members"
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    init() {
    }
}
