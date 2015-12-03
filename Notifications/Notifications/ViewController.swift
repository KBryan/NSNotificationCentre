//
//  ViewController.swift
//  Notifications
//
//  Created by KBryan on 2015-12-02.
//  Copyright © 2015 KBryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    var testObject:Moderator!
    var controllerObjects = [String]()
    
    @IBOutlet var myTableView: UITableView!
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return controllerObjects.count
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = controllerObjects[indexPath.row]
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // create an observer
    }
    /**
     Layout subview and create receiver
     */
    override func viewWillLayoutSubviews() {
        testObject = Moderator()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector(METHOD_CALLBACK), name: NOTIFICATION_ID, object: nil)
    }
    /**
     Update the datastructure containing value
     
     - parameter value: the value to append
     
     - returns: returned objects of string type
     */
   func updateObjectList(inout value:String) -> [String] {
            controllerObjects.append(value)
            return controllerObjects
    }
    /**
     Called back function associated with the NSNotificationCentre
     
     - parameter notification: the notifcation object
     */
    func notificationMethod(notification:NSNotification) {
        guard let urlObject = notification.object else {
            return // or throw
        }
        let blob = urlObject as! [URLObject] // String / Int
        for dataObjects in blob {
            var tempValue = dataObjects.RETURN_STRING
            self.updateObjectList(&tempValue)
            self.myTableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     Remove our Observer
     */
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

