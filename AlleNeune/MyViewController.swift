//
//  MyViewController.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 10/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation
import UIKit

class MyViewController : UIViewController {
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}
