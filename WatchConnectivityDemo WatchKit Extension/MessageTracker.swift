//
//  MessageTracker.swift
//  WatchConnectivityDemo
//
//  Created by Eric Hodgins on 2016-10-28.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import Foundation

class MessageTracker {
    
    static let sharedInstance = MessageTracker()
    private init () {}
    
    var messages = [Message]()
    
    func addMessage(message: String) {
        let message = Message(message)
        self.messages.append(message)
    }
}

class Message {
    
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    
}
