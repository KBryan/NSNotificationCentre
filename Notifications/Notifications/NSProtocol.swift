//
//  NSProtocol.swift
//  Notifications
//
//  Created by KBryan on 2015-12-02.
//  Copyright © 2015 KBryan. All rights reserved.
//

import Foundation


protocol NSProtocol {
    mutating func notificationInitializor() -> Void
    mutating func addDataObject(inout urls:URLObject) -> [URLObject]
}

