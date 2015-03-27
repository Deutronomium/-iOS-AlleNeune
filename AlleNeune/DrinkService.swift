//
//  DrinkService.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 11/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation

class DrinkService {
    
    func getByClub(clubID: Int) -> [Drink] {
        var params : NSDictionary
        let url = Drink.GET_BY_CLUB
        var response : [Drink] = []
        
        params = [
            Drink.ROOT : [
                Drink.CLUB_ID : clubID
            ]
        ]
        
        ApiPostHandler().apiPost(params, url: url) { (succeeded, postResponse) -> () in
            if succeeded {
                if let HTTPResponse = postResponse.response as? NSHTTPURLResponse {
                    let statusCode = HTTPResponse.statusCode
                    if statusCode == 200 {
                        let json = JSON(data: postResponse.data as NSData)
                        let drinks: Array<JSON> = json[Drink.ROOTS].arrayValue
                        for drink in drinks {
                            let id = drink[Drink.ID].intValue
                            let name = drink[Drink.NAME].stringValue
                            let price = drink[Drink.PRICE].intValue
                            let getDrink : Drink = Drink(id: id, name: name, price: price)
                            response.append(getDrink)
                        }
                    }
                }
            }
        }
        
        return response
    }
    
    func create(drinkName: String, drinkPrice: String, clubID: Int) -> Drink? {
        var params : NSDictionary
        let url = Drink.GENERIC_URL
        var apiResponse : Drink?
        
        params = [
            Drink.ROOT : [
                Drink.NAME : drinkName,
                Drink.PRICE : drinkPrice,
                Drink.CLUB_ID : clubID
            ]
        ]
        
        ApiPostHandler().apiPost(params, url: url) { (succeeded, postResponse) -> () in
            if succeeded {
                if let HTTPResponse = postResponse.response as? NSHTTPURLResponse {
                    let statusCode = HTTPResponse.statusCode
                    if statusCode == 201 {
                        let json = JSON(data: postResponse.data as NSData)
                        if let drinkDict = json[Drink.ROOT].dictionary {
                            let id = drinkDict[Drink.ID]!.intValue
                            let name = drinkDict[Drink.NAME]!.stringValue
                            let price = drinkDict[Drink.PRICE]!.intValue
                            apiResponse = Drink(id: id, name: name, price: price)
                        }
                    }
                }
            }
        }
    
        return apiResponse
    }
}