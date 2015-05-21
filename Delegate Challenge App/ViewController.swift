//
//  ViewController.swift
//  Delegate Challenge App
//
//  Created by Jon Gordon on 19/05/2015.
//  Copyright (c) 2015 JonGor Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldZip: UITextField!
    @IBOutlet weak var textFieldCurrency: UITextField!
    @IBOutlet weak var textFieldLockable: UITextField!
    @IBOutlet weak var switchLockable: UISwitch!

    let zipTextFieldDelegate = ZipTextFieldDelegate()
    let currencyTextFieldDelegate = CurrencyTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.textFieldZip.delegate = self.zipTextFieldDelegate
        self.textFieldCurrency.delegate = self.currencyTextFieldDelegate
        self.textFieldLockable.delegate = self

        self.switchLockable.setOn(false, animated: true)
    }

    // Text Field Delegate
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {

        return self.switchLockable.on
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {

        textFieldLockable.resignFirstResponder()
        return true
    }

    @IBAction func toggleLockable(sender: UISwitch) {

        if !(sender as UISwitch).on {
            self.switchLockable.resignFirstResponder()
        }
    }
}

