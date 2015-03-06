//
// Created by Patrick Engelkes on 05/03/15.
// Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

class UserService {

    func checkValidity(userName: String, email: String, password: String, passwordConfirmation: String, phoneNumber: String) -> UserValidity {
        
        let apiPostHandler = ApiPostHandler()
        var params : NSDictionary
        let url = ""
        var validity : UserValidity?

        if phoneNumber.isEmpty {
            params = [
                    User.ROOT: [
                            User.USER_NAME: userName,
                            User.EMAIL: email,
                            User.PASSWORD: password,
                            User.PASSWORD_CONFIRMATION: passwordConfirmation
                    ]
            ]
        } else {
            params = [
                    User.ROOT: [
                            User.USER_NAME: userName,
                            User.EMAIL: email,
                            User.PASSWORD: password,
                            User.PASSWORD_CONFIRMATION: passwordConfirmation,
                            User.PHONE_NUMBER: phoneNumber
                    ]
            ]
        }

        apiPostHandler.apiPost(params, url: url) { (succeeded, postResponse) -> () in
            if succeeded {
                if let HTTPResponse = postResponse.response as? NSHTTPURLResponse {
                    let statusCode = HTTPResponse.statusCode
                    if statusCode == 200 {
                        validity = UserValidity.VALID
                    } else if statusCode == 450 {
                        validity = UserValidity.NAME_AND_EMAIL_USED
                    } else if statusCode == 451 {
                        validity = UserValidity.NAME_USED
                    } else if statusCode == 452 {
                        validity = UserValidity.EMAIL_USED
                    }
                }
            }
        }
        
        return validity!
    }

}
