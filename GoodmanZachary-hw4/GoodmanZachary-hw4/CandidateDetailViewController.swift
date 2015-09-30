//
//  CandidateDetailViewController.swift
//  GoodmanZachary-hw4
//
//  Created by Zach Goodman on 9/30/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import UIKit

class CandidateDetailViewController: UIViewController {

    // ------------
    // data members
    // ------------
    
    var candidate : Candidate!
    
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
        firstNameLabel.text = candidate.firstName
        lastNameLabel.text = candidate.lastName
        stateLabel.text = candidate.state
        partyLabel.text = candidate.party
        votesLabel.text = String(candidate.votes)
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
