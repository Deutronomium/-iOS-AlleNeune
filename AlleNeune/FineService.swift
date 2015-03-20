//
//  FineService.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 11/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

class FineService {
    
    func getByClub(clubID: Int) -> [Fine] {
        var params : NSDictionary
        let url = Fine.GET_BY_CLUB
        var response : [Fine] = []
        
        params = [
            Fine.ROOT : [
                Fine.CLUB_ID : clubID
            ]
        ]
        
        ApiPostHandler().apiPost(params, url: url) { (succeeded, postResponse) -> () in
            if succeeded {
                if let HTTPResponse = postResponse.response as? NSHTTPURLResponse {
                    let statusCode = HTTPResponse.statusCode
                    if statusCode == 200 {
                        let json = JSON(data: postResponse.data as NSData)
                        let fines: Array<JSON> = json[Fine.ROOTS].arrayValue
                        for fine in fines {
                            let id = fine[Fine.ID].intValue
                            let name = fine[Fine.NAME].stringValue
                            let amount = fine[Fine.AMOUNT].intValue
                            let getFine : Fine = Fine(id: id, name: name, amount: amount)
                            response.append(getFine)
                        }
                    }
                }
            }
        }
        
        return response
    }
}