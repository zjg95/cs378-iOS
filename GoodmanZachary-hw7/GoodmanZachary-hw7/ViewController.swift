//
//  ViewController.swift
//  GoodmanZachary-hw7
//
//  Created by Zach Goodman on 11/1/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // -------
    // outlets
    // -------

    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var areaNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func button(sender: AnyObject) {
    }
    
    // -------
    // methods
    // -------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

