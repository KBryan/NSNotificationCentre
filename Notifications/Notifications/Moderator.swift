//
//  Moderator.swift
//  Notifications
//
//  Created by KBryan on 2015-12-02.
//  Copyright © 2015 KBryan. All rights reserved.
//

import UIKit
import Foundation

class Moderator: NSObject, NSProtocol {
    
    private var blob:URLObject = URLObject()
    private var returnedStringsFromFunction = [URLObject]()
    
    var RETURN_OBJECT:[URLObject] {
        return returnedStringsFromFunction
    }
    func notificationInitializor() {
        //
        self.addDataToFunction(self.blob)
        NSNotificationCenter.defaultCenter().postNotificationName("notificationID", object: RETURN_OBJECT)
    }
    override init() {
        //
        super.init()
        self.notificationInitializor()
    
    }
    func addDataToFunction(var urls:URLObject) -> [URLObject] {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
            let startTime = CFAbsoluteTimeGetCurrent()
            for var i = 0; i < 10000; i++ {
                
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
