//
//  DataModel.swift
//  GoodmanZachary-hw6
//
//  Created by Zach Goodman on 10/19/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataModel {
    
    // ------------
    // data members
    // ------------
    
    let candidateList: NSMutableArray = []
    private var people: [NSManagedObject] = []
    
    subscript(index: Int) -> Candidate {
        get {
            return candidateList[index] as! Candidate
        }
    }
    
    // -------
    // methods
    // -------
    
    func append(candidate: Candidate) {
        saveCandidate(candidate)
    }
    
    // --------------
    // read core data
    // --------------
    
    func readCoreData () {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        //
        let fetchRequest = NSFetchRequest(entityName:"Person")
        //
        var fetchedResults:[NSManagedObject]? = nil
        do {
            try fetchedResults = managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        if let results = fetchedResults {
            people = results
            for person in people {
                candidateList.addObject(person)
            }
        } else {
            print("Could not fetch")
        }
    }
    
    // --------------
    // save candidate
    // --------------
    
    func saveCandidate (candidate : Candidate) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        // Create the entity we want to save
        let entity =  NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        // Set the attribute values
        person.setValue(candidate.firstName, forKey: "firstName")
        person.setValue(candidate.lastName, forKey: "lastName")
        person.setValue(candidate.state, forKey: "state")
        person.setValue(candidate.party, forKey: "party")
        person.setValue(0, forKey: "numVotes")
        // Commit the changes.
        saveCoreData()
        // Add the new entity to our array of managed objects
        people.append(person)
        candidateList.addObject(person)
    }
    
    // --------------
    // save core data
    // --------------
    
    func saveCoreData () {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
}