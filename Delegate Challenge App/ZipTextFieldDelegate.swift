//
//  ZipTextFieldDelegate.swift
//  Delegate Challenge App
//
//  Created by Jon Gordon on 20/05/2015.
//  Copyright (c) 2015 JonGor Software. All rights reserved.
//

import Foundation
import UIKit

class ZipTextFieldDelegate: NSObject, UITextFieldDelegate {

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        var newText = textField.text as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)

        return newText.length <= 5
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}