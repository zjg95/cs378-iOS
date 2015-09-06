//
//  main.swift
//  GoodmanZachary-hw1
//
//  Created by Zach Goodman on 9/4/15.
//  Copyright (c) 2015 Zach Goodman. All rights reserved.
//

import Foundation

// ----------
// automobile
// ----------

class Automobile {
    
    // ------------
    // data members
    // ------------
    
    private var make  : String = ""
    private var model : String = ""
    private var numberOfDoors : Int = 0
    private var speed : Int = 0
    
    // -----------
    // constructor
    // -----------
    
    init (make : String, model : String, numberOfDoors : Int, speed : Int) {
        self.model = model
        self.make  = make
        self.speed = speed
        self.numberOfDoors = numberOfDoors
    }
    
    // ------
    // create
    // ------
    
    func create (make : String, model : String, numberOfDoors : Int, speed : Int) -> Automobile {
        return Automobile (make: make, model: model, numberOfDoors: numberOfDoors, speed: speed)
    }
    
    // ----
    // make
    // ----
    
    func getMake () -> String {
        return self.make
    }
    
    func setMake (make : String) {
        self.make = make
    }
    
    // -----
    // model
    // -----
    
    func getModel () -> String {
        return self.model
    }
    
    func setModel (model : String) {
        self.model = model
    }
    
    // -------------
    // numberOfDoors
    // -------------
    
    func getNumberOfDoors () -> Int {
        return self.numberOfDoors
    }
    
    func setNumberOfDoors (numberOfDoors : Int) {
        self.numberOfDoors = numberOfDoors
    }
    
    // -----
    // speed
    // -----
    
    func getSpeed () -> Int {
        return self.speed
    }
    
    func setSpeed (speed : Int) {
        self.speed = speed
    }
    
    // -----------
    // description
    // -----------
    
    func description () {
        
    }
}

// ----
// main
// ----

func main(){
    println("Hello world!")
}

main()

