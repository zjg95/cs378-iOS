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
        Candidate(firstName: "null", lastName: "null", state: "null", party: "null", votes: 0)
    ]
    
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
