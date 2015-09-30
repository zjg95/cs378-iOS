//
//  AddCandidateViewController.swift
//  GoodmanZachary-hw4
//
//  Created by Zach Goodman on 9/30/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import UIKit

class AddCandidateViewController: UIViewController, UITextFieldDelegate {
    
    // ------------
    // data members
    // ------------
    
    var candidateList : NSMutableArray!
    
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
        let candidate : Candidate = Candidate(firstName: firstNameField.text!, lastName: lastNameField.text!, state: stateField.text!, party: "party", votes: 0)
        candidateList.addObject(candidate)
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
