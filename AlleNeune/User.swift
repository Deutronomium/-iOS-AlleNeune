//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct User {
    //api parameters
    static let ROOT : String = "user"
    static let ID = "id"
    static let USER_NAME = "user_name"
    static let FIRST_NAME = "first_name"
    static let LAST_NAME = "last_name"
    static let PHONE_NUMBER = "phone_number"
    static let EMAIL = "email"
    static let STREET = "street"
    static let CITY = "city"
    static let PASSWORD = "password"
    static let PASSWORD_CONFIRMATION = "password_confirmation"

    //URLs
    static let GENERIC_URL = "/users"
    static let VALIDITY : String = User.GENERIC_URL + "/validity"
    static let GET_USER_BY_CLUB_NAME :String = User.GENERIC_URL + "/user_club";
}
