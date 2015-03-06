//
//  UIHelper.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 06/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation
import UIKit

struct UIHelper {
    static var myColor : UIColor = UIColor( red: 1, green: 0, blue:0, alpha: 1.0 )
    
    static func changeTextFieldColor(textField : UITextField, placeholderText : String) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIHelper.myColor.CGColor
        textField.text = ""
        textField.placeholder = placeholderText
    }
    
    static func resetBorder(textFields : UITextField...) {
        for textField in textFields {
            textField.layer.borderWidth = 0
        }
    }
}
