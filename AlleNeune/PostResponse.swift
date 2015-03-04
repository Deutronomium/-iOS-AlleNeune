//
//  PostResponse.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 04/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

class PostResponse {
    var data : AnyObject
    var response : AnyObject
    var error : AnyObject?
    
    init(data: AnyObject, response: AnyObject, error: AnyObject) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    init(data: AnyObject, response: AnyObject) {
        self.data = data
        self.response = response
        self.error = nil
    }
}
