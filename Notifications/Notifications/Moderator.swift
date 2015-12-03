//
//  Moderator.swift
//  Notifications
//
//  Created by KBryan on 2015-12-02.
//  Copyright © 2015 KBryan. All rights reserved.
//

import UIKit
import Foundation

struct  Moderator: NSProtocol {
    
    private var blob:URLObject = URLObject()
    private var returnedStringsFromFunction = [URLObject]()
    
    var RETURN_OBJECT:[URLObject] {
        return returnedStringsFromFunction
    }
    mutating func notificationInitializor() {
        //
        self.addDataToFunction(self.blob)
        NSNotificationCenter.defaultCenter().postNotificationName(NOTIFICATION_ID, object: RETURN_OBJECT)
    }
    init() {
        //
        
        self.notificationInitializor()
    
    }
    mutating func addDataToFunction(var urls:URLObject) -> [URLObject] {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
            let startTime = CFAbsoluteTimeGetCurrent()
            for var i = 0; i < 10000; i++ {
            ()
                urls = URLObject(url: "this is a website")
                self.returnedStringsFromFunction.append(urls)
            }
            let endTime = CFAbsoluteTimeGetCurrent()
            let totalTime = (endTime - startTime) * 1000
            print("Add Data To Function took: \(totalTime)")
        }
        
        return returnedStringsFromFunction
    }

}
