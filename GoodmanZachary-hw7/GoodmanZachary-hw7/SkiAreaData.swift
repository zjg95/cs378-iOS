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
    
    private let urlBegin: String = "http://ap.worldweatheronline.com/free/v2/ski.ashx?q="
    
    private let urlEnd: String = "&format=json&includelocation=yes&key=44e74f8f2c38b1ab0ffbbf7c1253c"
    
    // -------
    // methods
    // -------
    
    private func getURL(zipCode: String) -> NSURL {
        return NSURL(string: urlBegin + zipCode + urlEnd)!
    }
    
    private func getRawJSON(url: NSURL) -> NSDictionary {
        return NSDictionary()
    }
    
    private func getParsedJSON(json: NSDictionary) -> NSDictionary? {
        if let _ = json["error"] as? NSArray {
            // error exists in data
            return nil
        }
        return json
    }
    
    func session(url: NSURL) {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            if error != nil {
                print(error)
            } else {
                print(response)
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                    if jsonResult != nil {
                        if let results: NSDictionary = jsonResult!["data"] as? NSDictionary {
//                            self.weather = results["data"] as? NSArray
//                            if self.weather != nil {
//                                
//                            }
//                            else {
//                                print("weather is nil")
//                            }
                        }
                        else {
                            print("couldn't make a dictionary")
                        }
                    }
                    else {
                        print("no json returned")
                    }
                } catch {
                    // do something
                    print("caught an error")
                }
            }
        }
        task.resume() // start the request
    }
    
    func getData(zipCode: String) {
        let url: NSURL = getURL(zipCode)
        let json: NSDictionary = getRawJSON(url)
        if let parsedJSON = getParsedJSON(json) {
            self.delegate.responseDataHandler(parsedJSON)
        }
        else {
            delegate.responseError("No nearby ski facilities")
        }
    }
}