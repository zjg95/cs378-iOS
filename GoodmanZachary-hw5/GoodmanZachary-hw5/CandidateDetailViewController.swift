//
//  CandidateDetailViewController.swift
//  GoodmanZachary-hw4
//
//  Created by Zach Goodman on 9/30/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import UIKit
import CoreData

class CandidateDetailViewController: UIViewController {

    // ------------
    // data members
    // ------------
    
    var candidate : NSManagedObject!
    
    // ------------
    // data members
    // ------------

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        firstNameLabel.text = candidate.firstName
        firstNameLabel.text = candidate.valueForKey("firstName") as? String
//        lastNameLabel.text = candidate.lastName
        lastNameLabel.text = candidate.valueForKey("lastName") as? String
//        stateLabel.text = candidate.state
        stateLabel.text = candidate.valueForKey("state") as? String
//        partyLabel.text = candidate.party
        partyLabel.text = candidate.valueForKey("party") as? String
//        votesLabel.text = String(candidate.votes)
        votesLabel.text = String((candidate.valueForKey("numVotes") as? Int)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
