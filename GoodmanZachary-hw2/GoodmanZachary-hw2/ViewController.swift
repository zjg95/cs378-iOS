//
//  ViewController.swift
//  GoodmanZachary-hw2
//
//  Created by Zach Goodman on 9/10/15.
//  Copyright (c) 2015 Zach Goodman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var cityField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func btnSaveClicked(sender: AnyObject) {
        if nameField.text.isEmpty || cityField.text.isEmpty {
            myLabel.text = "You must enter a value for *both* name and city!!"
        }
        else {
            let value = nameField.text + " - " + cityField.text
            myLabel.text = value
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        cityField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

