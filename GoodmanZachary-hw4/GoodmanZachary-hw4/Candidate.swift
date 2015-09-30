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
    
    private var firstName_ : String = ""
    private var lastName_  : String = ""
    private var state_     : String = ""
    private var party_     : String = ""
    private var votes_     : Int = 0
    
    // ---------
    // accessors
    // ---------
    
    var firstName : String {
        get {
            return firstName_
        }
    }
    
    var lastName : String {
        get {
            return lastName_
        }
    }
    
    var state : String {
        get {
            return state_
        }
    }
    
    var party : String {
        get {
            return party_
        }
    }
    
    var votes : Int {
        get {
            return votes_
        }
    }
    
    // -----------
    // constructor
    // -----------
    
    init (firstName : String, lastName : String, state : String, party : String, votes : Int) {
        self.firstName_ = firstName
        self.lastName_  = lastName
        self.state_     = state
        self.party_     = party
        self.votes_     = votes
        
    }
    
}