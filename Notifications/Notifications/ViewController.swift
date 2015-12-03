//
//  ViewController.swift
//  Notifications
//
//  Created by KBryan on 2015-12-02.
//  Copyright © 2015 KBryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var testObject:Moderator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // create an observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector(METHOD_CALLBACK), name: NOTIFICATION_ID, object: nil)
        
    }
    override func viewDidAppear(animated: Bool) {
        testObject = Moderator()
    }
    // convience function for notfication method
    func notificationMethod(notification:NSNotification) {
        guard let urlObject = notification.object else {
            return // or throw
        }
        let blob = urlObject as! [URLObject] // String / Int
        for dataObjects in blob {
            print(dataObjects.RETURN_STRING)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
}

