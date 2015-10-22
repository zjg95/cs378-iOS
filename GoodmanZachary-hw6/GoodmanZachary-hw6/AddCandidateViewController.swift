//
//  AddCandidateViewController.swift
//  GoodmanZachary-hw4
//
//  Created by Zach Goodman on 9/30/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import UIKit

class AddCandidateViewController: UIViewController, UITextFieldDelegate, DataModelProtocol {
    
    // ------------
    // data members
    // ------------
    
    var delegate : CandidateManagerViewController!
    var myObservedClass: MyObservedClass!
    var candidate: Candidate!
    
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
        candidate = Candidate(firstName: firstNameField.text!, lastName: lastNameField.text!, state: stateField.text!, party: party, votes: 0)
//        delegate.saveCandidate(candidate)
        myObservedClass.updateProperty("new candidate")
        saveLabel.text = "Candidate Saved!"
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
    
    // ------
    // notify
    // ------
    
    func notify(message: String) {
        // We dispatch to the main thread because it's UI stuff we want to do and
        // because we don't know what thread called us.
        dispatch_async(dispatch_get_main_queue()) {
            let alertController = UIAlertController(title: "Notification", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action:UIAlertAction) in
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true, completion:nil)
        }
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

}
