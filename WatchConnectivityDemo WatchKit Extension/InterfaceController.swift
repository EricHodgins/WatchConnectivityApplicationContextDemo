//
//  InterfaceController.swift
//  WatchConnectivityDemo WatchKit Extension
//
//  Created by Eric Hodgins on 2016-10-24.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func sendMessageButtonPressed() {
        print("Sending message to iPhone...")
//        let delegate = WKExtension.shared().delegate as! ExtensionDelegate
//        delegate.sendMessageToPhone()
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationMessageFromWatch), object: nil)
        }
        
    }
}
