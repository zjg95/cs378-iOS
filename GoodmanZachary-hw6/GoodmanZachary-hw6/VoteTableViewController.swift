//
//  MyFilterViewController.swift
//  TestPopoverControllerSwift
//
//  Created by Robert Seitsinger on 9/22/15.
//  Copyright © 2015 cs378. All rights reserved.
//

import UIKit
import CoreData

class VoteTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var voteObserver: MyObservedClass!
    var delegate : CandidateManagerViewController!
    
    let cellId:String = "CellId"
    var tableView:UITableView = UITableView()
    
    var candidateList : NSArray!
    
    convenience init(title:String, preferredContentSize:CGSize) {
        self.init()
        
        // Set some view controller attributes
        self.preferredContentSize = preferredContentSize
        self.title = title
        
        self.modalPresentationStyle = UIModalPresentationStyle.Popover
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.frame         =   CGRectMake(0, 0, self.preferredContentSize.width, self.preferredContentSize.height);
        self.tableView.delegate      =   self
        self.tableView.dataSource    =   self
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        
        self.view.addSubview(self.tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.candidateList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellId, forIndexPath: indexPath)
        
        // Configure the cell...
        
        let filter = self.candidateList[indexPath.item] as! NSManagedObject
        
        cell.textLabel?.text = (filter.valueForKey("firstName") as? String)! + " " + (filter.valueForKey("lastName") as? String)!
        
        return cell
        
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let candidate = self.candidateList[indexPath.item] as! NSManagedObject
        
        let votes : Int = (candidate.valueForKey("numVotes") as? Int)! + 1
        
        candidate.setValue(votes, forKey: "numVotes")
        
        self.voteObserver.updateProperty("voted")
        self.delegate.saveCoreData()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
