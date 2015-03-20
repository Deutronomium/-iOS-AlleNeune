//
//  MyTextField.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 10/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import Foundation
import UIKit

class MyTextField : UITextField, UITextFieldDelegate {
    override init() {
        super.init()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func error(placeholderText : String) {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIHelper.myColor.CGColor
        self.text = ""
        self.placeholder = placeholderText
    }
    
    func reset() {
        self.layer.borderWidth = 0
    }

}
