//
//  CurrencyTextFieldDelegate.swift
//  Delegate Challenge App
//
//  Created by Jon Gordon on 20/05/2015.
//  Copyright (c) 2015 JonGor Software. All rights reserved.
//

import Foundation
import UIKit

class CurrencyTextFieldDelegate: NSObject, UITextFieldDelegate {

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        var oldText = textField.text as NSString
        var newText = oldText.stringByReplacingCharactersInRange(range, withString: string)
        var newTextString = String(newText)

        let digits = NSCharacterSet.decimalDigitCharacterSet()
        var digitText = ""
        for c in newTextString.unicodeScalars {
            if digits.longCharacterIsMember(c.value) {
                digitText.append(c)
            }
        }

        // Format the new string
        if let numOfPennies = digitText.toInt() {
            newText = "£" + self.poundStringFromInt(numOfPennies) + "." + self.penceStringFromInt(numOfPennies)
        } else {
            newText = "£0.00"
        }

        textField.text = newText

        return false
    }

    func textFieldDidBeginEditing(textField: UITextField) {

        if textField.text.isEmpty {
            textField.text = "£0.00"
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        return true
    }

    func poundStringFromInt(value: Int) -> String {

        return String(value / 100)
    }

    func penceStringFromInt(value: Int) -> String {

        let pence = value % 100
        var penceString = String(pence)

        if (pence < 10) {
            penceString = "0" + penceString
        }

        return penceString
    }
}