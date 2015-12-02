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
        NSNotificationCenter.defaultCenter().postNotificationName("notificationID", object: RETURN_OBJECTf)
    }
    override init() {
        //
        super.init()
        self.notificationInitializor()
    
    }
    func addDataToFunction(var urls:URLObject) -> [URLObject] {
        for var i = 0; i < 100; i++ {
            urls = URLObject(url: "this is a website")
            self.returnedStringsFromFunction.append(urls)
        }
        return returnedStringsFromFunction
    }

}
