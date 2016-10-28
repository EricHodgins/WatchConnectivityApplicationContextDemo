//
//  ViewController.swift
//  WatchConnectivityDemo
//
//  Created by Eric Hodgins on 2016-10-24.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageFromWatchLabel: UILabel!
    
    var colors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.black]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.watchSendMessageButtonPressed(notification:)), name: NSNotification.Name(rawValue: NotificationButtonPressedOnWatch), object: nil)
    }


    @IBAction func sendMessageButtonPressed(_ sender: AnyObject) {
        print("Sending from iPhone...")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationButtonPressedOnPhone), object: nil)
    }
    
    func changeBackgroundColor() {
        let index = arc4random_uniform(UInt32(colors.count))
        let randomColor = colors[Int(index)]
        view.backgroundColor = randomColor
    }

}

extension ViewController {
    func watchSendMessageButtonPressed(notification: Notification) {
        print("Receiving from watch...")
        
        DispatchQueue.main.async {
            if let message = notification.userInfo?["message"] as? String {
                self.messageFromWatchLabel.isHidden = false
                self.messageFromWatchLabel.text = message
            }
        }
    }
}

