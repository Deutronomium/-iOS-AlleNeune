//
//  ViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 03/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("It works")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func post() -> Bool {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/drinks/get_by_club")!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"

        var params = ["drink":["club_id":1]] as Dictionary

        var err : NSError?

        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            //println("Response: \(response)")
            println(data)
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            //println("Body: \(strData)")
            
            if (err != nil) {
                println("Error could not parse JSON")
            } else {
                let json = JSON(data: data)
                println(json)
                if let id = json["drinks"][0]["id"].number {
                    println("ID: \(id)")
                } else {
                    println("Error")
                    println((json["drinks"][0]["id"]))
                }

            }
            
            
        })
        
        task.resume()
        return true
    }
}

