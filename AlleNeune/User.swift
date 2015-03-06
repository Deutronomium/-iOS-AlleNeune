//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct User {
    //api parameters
    let ROOT = "user"
    let ID = "id"
    let USER_NAME = "user_name"
    let FIRST_NAME = "first_name"
    let LAST_NAME = "last_name"
    let PHONE_NUMBER = "phone_number"
    let EMAIL = "email"
    let STREET = "street"
    let CITY = "city"
    let PASSWORD = "password"
    let PASSWORD_CONFIRMATION = "password_confirmation"

    //URLs
    let GENERIC_URL = "/users"
    let VALIDITY : String = User().GENERIC_URL + "/validity"
    let GET_USER_BY_CLUB_NAME :String = User().GENERIC_URL + "/user_club";
}
