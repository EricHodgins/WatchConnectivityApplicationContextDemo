//
//  MessagesDetailController.swift
//  WatchConnectivityDemo
//
//  Created by Eric Hodgins on 2016-10-27.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import WatchKit
import Foundation


class MessagesDetailController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        refreshTable()
    }
    
    deinit {
        print("Watch gone.")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func addRow(withMessage message: String, atIndex index: Int) {
        
        let controller = table.rowController(at: index) as! PhoneMessageRowController
        controller.phoneMessageLabel.setText(message)
    }
    
    func refreshTable() {
        table.setNumberOfRows(MessageTracker.sharedInstance.messages.count, withRowType: "PhoneMessage")
        
        for (index, message) in MessageTracker.sharedInstance.messages.enumerated() {
            addRow(withMessage: message.message, atIndex: index)
        }
    }

}

























