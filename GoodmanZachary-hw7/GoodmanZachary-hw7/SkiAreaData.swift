//
//  SkiAreaData.swift
//  GoodmanZachary-hw7
//
//  Created by Zach Goodman on 11/1/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import Foundation

protocol SkiAreaDataProtocol {
    func responseDataHandler(data: NSDictionary)
    func responseError(message: String)
}

class SkiAreaData {
    
    // ------------
    // data members
    // ------------
    
    var delegate: SkiAreaDataProtocol!
    
    // -------
    // methods
    // -------
    
    func getData(zipCode: String) {
        delegate.responseError("No nearby ski facilities")
    }
}