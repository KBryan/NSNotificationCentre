//
//  Moderator.swift
//  Notifications
//
//  Created by KBryan on 2015-12-02.
//  Copyright © 2015 KBryan. All rights reserved.
//

import UIKit
import Foundation

struct Moderator: NSProtocol {
    
    private var blob:URLObject = URLObject()
    private var returnedStringsFromFunction = [URLObject]()
    
    var RETURN_OBJECT:[URLObject] {
        return returnedStringsFromFunction
    }
    mutating func notificationInitializor() {
        //
        self.addDataObject(&self.blob)
        NSNotificationCenter.defaultCenter().postNotificationName(NOTIFICATION_ID, object: returnedStringsFromFunction)
    }
    init() {
        
        self.notificationInitializor()
        
    }
    mutating func addDataObject(inout urls:URLObject) -> [URLObject] {
        
        for var i = 0; i < 100; i++ {
            
            urls = URLObject(url: "this is a website \(i)")
            
            self.returnedStringsFromFunction.append(urls)
            
        }
        
        return self.returnedStringsFromFunction
    }
}
