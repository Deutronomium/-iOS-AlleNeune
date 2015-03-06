//
//  SessionController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 04/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

class SessionService {
    
    func logIn(email : String, password : String) -> Bool {
        var semaphore = dispatch_semaphore_create(0)
        let apiPostHandler = ApiPostHandler()
        
        var params = [
            Session.ROOT: [
                Session.EMAIL : email,
                Session.PASSWORD : password
            ]
        ]
        var url = apiPostHandler.HOST + Session.GENERIC_URL
        var success = false;
        apiPostHandler.apiPost(params, url: url) { (succeeded, postResponse) -> () in
            if succeeded {
                if let HTTPResponse = postResponse.response as? NSHTTPURLResponse {
                    let statusCode = HTTPResponse.statusCode
                    if statusCode == 200 {
                        success = true
                        dispatch_semaphore_signal(semaphore)
                    }
                }
            }
        }
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return success
    }
}