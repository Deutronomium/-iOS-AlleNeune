//
//  EventService.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 11/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

class EventService {
    
    func create(eventName: String, eventDate: String, clubID: Int) -> Event {
        var params : NSDictionary
        let url = Event.GENERIC_URL
        var apiResponse : Event?
        
        params = [
            Event.ROOT : [
                Event.NAME : eventName,
                Event.DATE : eventDate,
                Event.CLUB_ID : clubID
            ]
        ]
        
        ApiPostHandler().apiPost(params, url: url) { (succeeded, postResponse) -> () in
            if succeeded {
                if let HTTPResponse = postResponse.response as? NSHTTPURLResponse {
                    let statusCode = HTTPResponse.statusCode
                    if statusCode == 201 {
                        let json = JSON(data: postResponse.data as NSData)
                        println(json)
                        
                    }
                }
            }
        }
        
        return apiResponse!
    }
    
    func getEventsByClub(clubID : Int) -> [Event]? {
        var params : NSDictionary
        let url = Event.GET_BY_CLUB
        var response : [Event]?
        
        params = [
            Event.ROOT : [
                Event.CLUB_ID : clubID
            ]
        ]
        
        ApiPostHandler().apiPost(params, url: url) { (succeeded, postResponse) -> () in
            if succeeded {
                if let HTTPResponse = postResponse.response as? NSHTTPURLResponse {
                    let statusCode = HTTPResponse.statusCode
                    if statusCode == 200 {
                        let json = JSON(data: postResponse.data as NSData)
                        println(json)
                        if let eventsDict = json[Event.ROOT + "s"].dictionary {
                            
                        }
                        
                    }
                }
            }
        }
        
        return response
    }
    
    
}
