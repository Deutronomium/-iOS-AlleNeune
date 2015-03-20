//
//  SessionController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 04/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

var currentUser : User = User()
class SessionService {
    
    func logIn(email : String, password : String) -> SessionLogin {
        let apiPostHandler = ApiPostHandler()
        
        var params = [Session.ROOT: [Session.EMAIL : email, Session.PASSWORD : password]]
        var url = Session.GENERIC_URL
        var logInResponse : SessionLogin?
        apiPostHandler.apiPost(params, url: url) { (succeeded, postResponse) -> () in
            if succeeded {
                if let HTTPResponse = postResponse.response as? NSHTTPURLResponse {
                    let statusCode = HTTPResponse.statusCode
                    if statusCode == 200 {
                        let json = JSON(data: postResponse.data as NSData)
                        if let userDict = json[User.ROOT].dictionary {
                            let id = userDict[User.ID]!.intValue
                            let userName = userDict[User.USER_NAME]!.stringValue
                            let phoneNumber = userDict[User.PHONE_NUMBER]!.stringValue
                            currentUser = User(id: id, userName: userName, phoneNumber: phoneNumber)
                            logInResponse = SessionLogin.SUCCESS
        
                        }
                    } else if statusCode == 460 {
                        logInResponse = SessionLogin.WRONG_EMAIL
                    } else if statusCode == 461 {
                        logInResponse = SessionLogin.WRONG_PASSWORD
                    } else {
                        logInResponse = SessionLogin.BAD_REQUEST
                    }
                }
            }
        }
        
        return logInResponse!
    }
}