//
//  WatchSessionDelegate.swift
//  WatchConnectivityDemo
//
//  Created by Eric Hodgins on 2016-10-26.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import Foundation
import WatchConnectivity

class WatchSessionDelegate: NSObject, WCSessionDelegate {
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(WatchSessionDelegate.sendMessageToPhone), name: NSNotification.Name(rawValue: NotificationMessageFromWatch), object: nil)
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("Session activation failed with error: \(error.localizedDescription)")
            return
        }
        
        print("Session activation with state: \(activationState.rawValue)")
    }
    
    
    func sendMessageToPhone() {
        if WCSession.isSupported() {
            do {
                let dict = ["message" : "Hello....phone!..\(arc4random())"]
                print("Extension Delegate send message.")
                try WCSession.default().updateApplicationContext(dict)
            } catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("did receive message...📞")
    }
    
}
