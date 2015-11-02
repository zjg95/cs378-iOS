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
    
    private let urlBegin: String = "http://api.worldweatheronline.com/free/v2/ski.ashx?q="
    
    private let urlEnd: String = "&format=json&includelocation=yes&key=44e74f8f2c38b1ab0ffbbf7c1253c"
    
    // -------
    // methods
    // -------
    
    private func getURL(zipCode: String) -> NSURL {
        return NSURL(string: urlBegin + zipCode + urlEnd)!
    }
    
    private func getTask(url: NSURL) -> NSURLSessionDataTask {
        let session = NSURLSession.sharedSession()
        return session.dataTaskWithURL(url) { (data, response, error) -> Void in
            var json: NSDictionary!
            if error != nil {
                print(error)
            } else {
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                    if jsonResult != nil {
                        if let results: NSDictionary = jsonResult!["data"] as? NSDictionary {
                            json = results
                        }
                    }
                } catch {
                    print("caught an error")
                }
            }
            if json != nil {
                self.didReceiveData(json)
            }
            else {
                print("json is nil!")
            }
        }
    }
    
    private func sendRequest(url: NSURL) {
        let task = getTask(url)
        task.resume() // start the request
    }
    
    private func getParsedJSON(json: NSDictionary) -> NSDictionary? {
        if let _ = json["error"] as? NSArray {
            // error exists in data
            return nil
        }
        var parsed: [String:String] = [String:String]()
        if let nearest_area = (json["nearest_area"] as? NSArray)![0] as? NSDictionary {
            if let areaName = (nearest_area["areaName"] as? NSArray)![0] as? NSDictionary {
                parsed["areaName"] = areaName["value"] as? String
            }
            if let country = (nearest_area["country"] as? NSArray)![0] as? NSDictionary {
                parsed["country"] = country["value"] as? String
            }
            if let region = (nearest_area["region"] as? NSArray)![0] as? NSDictionary {
                parsed["region"] = region["value"] as? String
            }
        }
        return parsed
    }
    
    func getData(zipCode: String) {
        let url: NSURL = getURL(zipCode)
        sendRequest(url)
    }
    
    func didReceiveData(json: NSDictionary) {
        var closure = {}
        if let parsedJSON = getParsedJSON(json) {
            closure = {self.delegate.responseDataHandler(parsedJSON)}
        }
        else {
            closure = {self.delegate.responseError("No nearby ski facilities")}
        }
        dispatch_async(dispatch_get_main_queue()) {
            closure()
        }
    }
}