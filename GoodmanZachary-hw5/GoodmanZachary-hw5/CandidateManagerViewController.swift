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
    
    var candidateList : NSMutableArray = []
    var people = [NSManagedObject]()

    @IBOutlet weak var voteButton: UIButton!
    
    @IBOutlet weak var showVotesButton: UIButton!
    
    @IBAction func voteButton(sender: AnyObject) {
        let popOverController = MyPopoverViewController(type: "Vote", candidateList: self.candidateList)
        
        popOverController.presentPopover(sourceController: self, sourceView: self.voteButton, sourceRect: self.showVotesButton.bounds)
        print("vote pressed")
    }
    
    @IBAction func showVotesButton(sender: AnyObject) {
        let popOverController = MyPopoverViewController(type: "Votes", candidateList: self.candidateList)
        
        popOverController.presentPopover(sourceController: self, sourceView: self.showVotesButton, sourceRect: self.showVotesButton.bounds)
        print("showVotes pressed")
    }
    
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
                destination.candidateList = self.candidateList
                destination.people = self.people
            }
        }
        if (segue.identifier == "showCandidateSegue") {
            if let destination = segue.destinationViewController as? CandidateTableViewController {
                destination.candidateList = self.candidateList
                destination.people = self.people
            }
        }
    }

}
