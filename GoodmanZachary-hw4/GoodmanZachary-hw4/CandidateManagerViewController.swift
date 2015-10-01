//
//  CandidateManagerViewController.swift
//  GoodmanZachary-hw4
//
//  Created by Zach Goodman on 9/30/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import UIKit

class CandidateManagerViewController: UIViewController {
    
    var candidateList : NSMutableArray = [
        Candidate(firstName: "Donald", lastName: "Trump", state: "Texas", party: "Republican", votes: 0)
    ]

    @IBOutlet weak var voteButton: UIButton!
    
    @IBOutlet weak var showVotesButton: UIButton!
    
    @IBAction func voteButton(sender: AnyObject) {
        print("vote pressed")
    }
    
    @IBAction func showVotesButton(sender: AnyObject) {
        let popOverController = MyPopoverViewController(type: "Votes", candidateList: self.candidateList)
        
        popOverController.presentPopover(sourceController: self, sourceView: self.showVotesButton, sourceRect: self.showVotesButton.bounds)
        print("showVotes pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                destination.candidateList = self.candidateList
            }
        }
        if (segue.identifier == "showCandidateSegue") {
            if let destination = segue.destinationViewController as? CandidateTableViewController {
                destination.candidateList = self.candidateList
            }
        }
    }

}
