//
//  MyObservedClass.swift
//  TestKVO2Swift
//
//  Created by Robert Seitsinger on 10/14/15.
//  Copyright © 2015 cs378. All rights reserved.
//

import Foundation

class MyObservedClass: NSObject {

    // dynamic is required for KVO
    dynamic var myObservedProperty = "Hi"
    
    func updateProperty(newValue: String) {
        // change the value of the observed property, to fire KVO
        myObservedProperty = newValue
    }

}
