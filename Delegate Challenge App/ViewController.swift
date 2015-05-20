//
//  ViewController.swift
//  Delegate Challenge App
//
//  Created by Jon Gordon on 19/05/2015.
//  Copyright (c) 2015 JonGor Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

