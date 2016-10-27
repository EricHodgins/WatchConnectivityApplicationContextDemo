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
    
    var colors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.black]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.watchSendMessageButtonPressed), name: NSNotification.Name(rawValue: NotificationButtonPressedOnWatch), object: nil)
    }


    @IBAction func sendMessageButtonPressed(_ sender: AnyObject) {
        print("Sending from iPhone...")
        //let delegate = UIApplication.shared.delegate as! AppDelegate
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationButtonPressedOnPhone), object: nil)
    }
    
    func changeBackgroundColor() {
        let index = arc4random_uniform(UInt32(colors.count))
        let randomColor = colors[Int(index)]
        view.backgroundColor = randomColor
    }

}

extension ViewController {
    func watchSendMessageButtonPressed() {
        print("Receiving from watch...")
        DispatchQueue.main.async {
            self.changeBackgroundColor()
        }
    }
}

