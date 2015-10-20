//
//  CandidateManagerViewController.swift
//  GoodmanZachary-hw4
//
//  Created by Zach Goodman on 9/30/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import UIKit
import CoreData

class CandidateManagerViewController: UIViewController {
    
    // ------------
    // data members
    // ------------
    
    var candidateList : NSMutableArray = []
    var people = [NSManagedObject]()
    
    var delegate : DataModelProtocol?

    @IBOutlet weak var voteButton: UIButton!
    
    @IBOutlet weak var showVotesButton: UIButton!
    
    // ----
    // vote
    // ----
    
    @IBAction func voteButton(sender: AnyObject) {
        let popOverController = MyPopoverViewController(type: "Vote", candidateList: self.candidateList)
        
        popOverController.delegate = self
        
        popOverController.presentPopover(sourceController: self, sourceView: self.voteButton, sourceRect: self.showVotesButton.bounds)
    }
    
    // ----------
    // show votes
    // ----------
    
    @IBAction func showVotesButton(sender: AnyObject) {
        let popOverController = MyPopoverViewController(type: "Votes", candidateList: self.candidateList)
        
        popOverController.presentPopover(sourceController: self, sourceView: self.showVotesButton, sourceRect: self.showVotesButton.bounds)
        print("showVotes pressed")
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
        if (delegate != nil){
            delegate!.notify("Data has been saved.")
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
        readCoreData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "addCandidateSegue") {
            if let destination = segue.destinationViewController as? AddCandidateViewController {
                destination.delegate = self
                self.delegate = destination
            }
        }
        if (segue.identifier == "showCandidateSegue") {
            if let destination = segue.destinationViewController as? CandidateTableViewController {
                destination.candidateList = self.candidateList
            }
        }
    }

}
