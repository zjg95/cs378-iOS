//
//  CandidateManagerViewController.swift
//  GoodmanZachary-hw4
//
//  Created by Zach Goodman on 9/30/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import UIKit

// define a global context variable for the KVO
private var voteContext = 0
private var addCandidateContext = 0

class CandidateManagerViewController: UIViewController {
    
    // ------------
    // data members
    // ------------
    
    // a constant for the observed property key path
    let observedPropertyKeyPath = "myObservedProperty"
    
    // define a property for the object that contains the property we want to observe
    var addCandidateObserver = MyObservedClass()
    var voteObserver = MyObservedClass()
    
    let dataModel: DataModel = DataModel()
    
    var delegate: DataModelProtocol?
    
    // -------
    // outlets
    // -------

    @IBOutlet weak var voteButton: UIButton!
    
    @IBOutlet weak var showVotesButton: UIButton!
    
    // ----
    // vote
    // ----
    
    @IBAction func voteButton(sender: AnyObject) {
        let popOverController = MyPopoverViewController(type: "Vote", candidateList: self.dataModel.candidateList)
        
        popOverController.delegate = self
        popOverController.voteObserver = self.voteObserver
        
        popOverController.presentPopover(sourceController: self, sourceView: self.voteButton, sourceRect: self.showVotesButton.bounds)
    }
    
    // ----------
    // show votes
    // ----------
    
    @IBAction func showVotesButton(sender: AnyObject) {
        let popOverController = MyPopoverViewController(type: "Votes", candidateList: self.dataModel.candidateList)
        
        popOverController.presentPopover(sourceController: self, sourceView: self.showVotesButton, sourceRect: self.showVotesButton.bounds)
        print("showVotes pressed")
    }
    
    // --------------
    // save candidate
    // --------------
    
    func saveCandidate(candidate : Candidate) {
        dataModel.saveCandidate(candidate)
        delegate?.notify("Data has been saved.")
        print("Candidate added")
    }
    
    // --------------
    // save core data
    // --------------
    
    func saveCoreData() {
        dataModel.saveCoreData()
        print("Core data saved")
    }
    
    deinit {
        // you need to remove the observer before this object goes away
        voteObserver.removeObserver(self, forKeyPath: observedPropertyKeyPath, context: &voteContext)
        addCandidateObserver.removeObserver(self, forKeyPath: observedPropertyKeyPath, context: &addCandidateContext)
    }
    
    // This is the method that gets called when the observed property changes.
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        // Handle observations only for your context. Pass any others up the chain.
        if context == &voteContext {
            saveCoreData()
        }
        else if context == &addCandidateContext {
            saveCandidate(Candidate(firstName: "", lastName: "", state: "", party: "", votes: 0))
        } else {
            // Pass this up the chain.
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }
    
    // -------
    // methods
    // -------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addCandidateObserver.addObserver(self, forKeyPath: observedPropertyKeyPath, options: [.Old, .New], context: &addCandidateContext)
        voteObserver.addObserver(self, forKeyPath: observedPropertyKeyPath, options: [.Old, .New], context: &voteContext)
        
        dataModel.readCoreData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
                destination.candidateList = self.dataModel.candidateList
            }
        }
    }

}
