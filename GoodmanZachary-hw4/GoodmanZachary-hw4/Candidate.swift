//
//  Candidate.swift
//  GoodmanZachary-hw4
//
//  Created by Zach Goodman on 9/29/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import Foundation

// ---------
// candidate
// ---------

class Candidate {
    
    // ------------
    // data members
    // ------------
    
    private var firstName : String = ""
    private var lastName  : String = ""
    private var state     : String = ""
    private var party     : String = ""
    private var votes     : Int = 0
    
    // -----------
    // constructor
    // -----------
    
    init (firstName : String, lastName : String, state : String, party : String, votes : Int) {
        self.firstName = firstName
        self.lastName  = lastName
        self.state     = state
        self.party     = party
        self.votes     = votes
        
    }
}