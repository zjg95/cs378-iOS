//
//  Card.swift
//  GoodmanZachary-hw3
//
//  Created by Zach Goodman on 9/25/15.
//  Copyright (c) 2015 Zach Goodman. All rights reserved.
//

import Foundation
import UIKit

// ----
// card
// ----

class Card {
    
    // ------------
    // data members
    // ------------
    
    private var img : UIImage!
    private var suit :  String = ""
    private var value : String = ""
    private var name :  String {
        get {
            return value + " of " + suit
        }
    }
    
    // -----------
    // constructor
    // -----------
    
    init (s : String, v : String, url : String) {
        self.suit  = s
        self.value = v
        self.img   = UIImage(named : url)
    }
}