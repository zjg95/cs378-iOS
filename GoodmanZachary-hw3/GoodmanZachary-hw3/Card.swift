//
//  Card.swift
//  GoodmanZachary-hw3
//
//  Created by Zach Goodman on 9/25/15.
//  Copyright (c) 2015 Zach Goodman. All rights reserved.
//

import Foundation

// ----
// card
// ----

class Card {
    
    // ------------
    // data members
    // ------------
    
    private var suit :  String = ""
    private var value : String = ""
    
    var name :  String {
        get {
            return value + " " + suit
        }
    }
    
    var img : String {
        get {
            return suit + value + ".png"
        }
    }
    
    // -----------
    // constructor
    // -----------
    
    init (s : String, v : String) {
        self.suit  = s
        self.value = v
    }
}