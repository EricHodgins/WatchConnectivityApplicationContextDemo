//
//  DeviceSessionDelegate.swift
//  WatchConnectivityDemo
//
//  Created by Eric Hodgins on 2016-10-26.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import Foundation
import WatchConnectivity

class DeviceSessionDelegate: NSObject, WCSessionDelegate {
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(DeviceSessionDelegate.sendMessageToWatch), name: NSNotification.Name(rawValue: NotificationButtonPressedOnPhone), object: nil)
    }
    
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("Session became inactive.")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("Session did deactivate.")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("Session activation error: \(activationState.rawValue) - \(error.localizedDescription)")
            return
        }
        
        print("Session activated with state: \(activationState.rawValue)")
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("RECEIVED FROM ⌚️")
        if let message = applicationContext["message"] as? String {
            let userInfo: [String : String] = ["message" : message]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationButtonPressedOnWatch), object: nil, userInfo: userInfo)
        }
    }
    
    func sendMessageToWatch() {
        print("Sending message to watch.")
        if WCSession.isSupported() {
            let session = WCSession.default()
            if session.isWatchAppInstalled {
                do {
                    let dict = ["message": "Hello...watch!..\(arc4random())"]
                    try session.updateApplicationContext(dict)
                } catch {
                    print("ERROR: \(error.localizedDescription)")
                }
            }
        }
    }

}
