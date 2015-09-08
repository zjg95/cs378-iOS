//
//  main.swift
//  GoodmanZachary-hw1
//
//  Created by Zach Goodman on 9/4/15.
//  Copyright (c) 2015 Zach Goodman. All rights reserved.
//

import Foundation

// ------------------
// randomValueBetween
// ------------------

func randomValueBetween (min:UInt32, max:UInt32) -> UInt32 {
    var randomValue:UInt32 = min + arc4random_uniform(UInt32(max - min + 1))
    return randomValue
}

// ----
// main
// ----

func main () {
    // initialize automobiles
    
    var car1 : Automobile = Automobile.create("Maserati", model: "GranTurismo", numberOfDoors: 2, speed: 0)
    var car2 : Automobile = Automobile.create("Honda", model: "Accord", numberOfDoors: 4, speed: 0)
    var car3 : Automobile = Automobile.create("Tesla", model: "S", numberOfDoors: 2, speed: 0)
    
    // loop
    
    let min : UInt32 = 0
    let max : UInt32 = 16
    
    for i in 0..<10 {
        car1.setSpeed(Int(randomValueBetween(min, max)))
        car2.setSpeed(Int(randomValueBetween(min, max)))
        car3.setSpeed(Int(randomValueBetween(min, max)))
    }
    
    // print states
    
    car1.description()
    car2.description()
    car3.description()
}

main()

