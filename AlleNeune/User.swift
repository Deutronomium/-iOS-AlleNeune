//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

struct User {
    var id : Int?
    var userName : String?
    var firstName : String?
    var lastName : String?
    var phoneNumber : String?
    var email : String?
    var street : String?
    var city : String?
    
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
    
    init(id : Int, userName : String, phoneNumber : String) {
        self.id = id;
        self.userName = userName
        self.phoneNumber = phoneNumber
    }
    
    init() {}
}
