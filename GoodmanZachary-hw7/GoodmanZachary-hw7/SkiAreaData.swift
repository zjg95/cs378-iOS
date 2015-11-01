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
    
    let error: Bool = true
    
    // -------
    // methods
    // -------
    
    func getData(zipCode: String) {
        if error {
            delegate.responseError("No nearby ski facilities")
        }
        else {
            delegate.responseDataHandler(NSDictionary())
        }
    }
}