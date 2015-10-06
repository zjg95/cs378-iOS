//
//  AddCandidateViewController.swift
//  GoodmanZachary-hw4
//
//  Created by Zach Goodman on 9/30/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import UIKit
import CoreData

class AddCandidateViewController: UIViewController, UITextFieldDelegate {
    
    // ------------
    // data members
    // ------------
    
    var candidateList : NSMutableArray!
    var people : [NSManagedObject]!
    
    // ------------
    // data outlets
    // ------------

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var partySegment: UISegmentedControl!
    @IBOutlet weak var saveLabel: UILabel!
    
    // -----------
    // save button
    // -----------
    
    @IBAction func saveButton(sender: AnyObject) {
        dismissKeyboard()
        var party : String!
        switch partySegment.selectedSegmentIndex {
        case 0:
            party = "Democrat"
        case 1:
            party = "Republican"
        default:
            party = "Error"
        }
        let candidate : Candidate = Candidate(firstName: firstNameField.text!, lastName: lastNameField.text!, state: stateField.text!, party: party, votes: 0)
//        candidateList.addObject(candidate)
        savePerson(candidate)
        saveLabel.text = "Candidate Saved!"
    }
    
    func savePerson(candidate : Candidate) {
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
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        // Add the new entity to our array of managed objects
        people.append(person)
        candidateList.addObject(person)
    }
    
    // ---------------------
    // textFeildShouldReturn
    // ---------------------
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        stateField.resignFirstResponder()
        return true
    }
    
    // ---------------
    // dismissKeyboard
    // ---------------
    
    func dismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        firstNameField.delegate = self
        lastNameField.delegate  = self
        stateField.delegate     = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("returning")
        if (segue.identifier == "addCandidateSegue") {
            print("passing through add candidate segue")
            if let destination = segue.destinationViewController as? CandidateManagerViewController {
                destination.candidateList = self.candidateList
            }
        }
    }
    */

}
