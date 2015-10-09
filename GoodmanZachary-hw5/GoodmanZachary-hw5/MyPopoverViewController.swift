//
//  MyPopoverViewController.swift
//  GoodmanZachary-hw4
//
//  Created by Zach Goodman on 9/30/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import UIKit

class MyPopoverViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var delegate : CandidateManagerViewController!
    
    var type : String!
    var voteTable : VoteTableViewController!
    var showVoteTable : ShowVoteTableViewController!
    var candidateList : NSMutableArray!
    
    convenience init(type : String, candidateList : NSMutableArray) {
        self.init()
        
        // Set some view controller attributes
        self.candidateList = candidateList
        self.type = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentPopover(sourceController sourceController:UIViewController, sourceView:UIView, sourceRect:CGRect) {
        
        // Create the view controller we want to display as the popup.
        
        self.voteTable = VoteTableViewController(title: self.type, preferredContentSize: CGSize(width: 250, height: 180))
        self.showVoteTable = ShowVoteTableViewController(title: self.type, preferredContentSize: CGSize(width: 250, height: 180))
        
        self.voteTable.candidateList = self.candidateList
        self.showVoteTable.candidateList = self.candidateList
        
        // Cause the views to be created in this view controller. Gets them added to the view hierarchy.
        self.voteTable?.view
        self.voteTable?.tableView.layoutIfNeeded()
        
        self.showVoteTable?.view
        self.showVoteTable?.tableView.layoutIfNeeded()
        
        // Set attributes for the popover controller.
        // Notice we're get an existing object from the view controller we want to popup!
        
        var popoverMenuViewController = self.voteTable.popoverPresentationController
        popoverMenuViewController?.permittedArrowDirections = .Any
        popoverMenuViewController?.delegate = self
        popoverMenuViewController?.sourceView = sourceView
        popoverMenuViewController?.sourceRect = sourceRect
        
        popoverMenuViewController = self.showVoteTable.popoverPresentationController
        popoverMenuViewController?.permittedArrowDirections = .Any
        popoverMenuViewController?.delegate = self
        popoverMenuViewController?.sourceView = sourceView
        popoverMenuViewController?.sourceRect = sourceRect
        
        // Show the popup.
        // Notice we are presenting form a view controller passed in. We need to present from a view controller
        // that has views that are already in the view hierarchy.
        if (type == "Votes"){
            sourceController.presentViewController(self.showVoteTable, animated: true, completion: nil)
        }
        else {
            self.voteTable.delegate = self.delegate
            sourceController.presentViewController(self.voteTable, animated: true, completion: nil)
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        // Indicate we want the same presentation behavior on both iPhone and iPad.
        return UIModalPresentationStyle.None
    }
    
}

