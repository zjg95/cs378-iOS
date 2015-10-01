//
//  MyFilterViewController.swift
//  TestPopoverControllerSwift
//
//  Created by Robert Seitsinger on 9/22/15.
//  Copyright © 2015 cs378. All rights reserved.
//

import UIKit

class VoteTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        //        let index:Int = indexPath.row
        
        //        let filter:FilterItem = self.data.getFilterItem(index: index)
        let filter:Candidate = self.candidateList[indexPath.item] as! Candidate
        
        cell.textLabel?.text = filter.firstName + " " + filter.lastName
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let candidate:Candidate = self.candidateList[indexPath.item] as! Candidate
        
        candidate.votes = candidate.votes + 1
        
        print("You selected cell #\(indexPath.row), title: \(candidate.firstName) \(candidate.lastName)")
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
