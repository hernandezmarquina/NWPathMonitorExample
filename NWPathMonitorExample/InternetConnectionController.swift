//
//  InternetConnectionController.swift
//  NWPathMonitorExample
//
//  Created by Jonathan Hernandez on 11/10/21.
//

import Foundation
import UIKit


class InternetConnectionController: UIViewController {
    
    var deviceConnected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(deviceConnected(_:)), name: .connected, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(connectionLost(_:)), name: .connectionLost, object: nil)
    }
    
    @objc private func deviceConnected(_ notification: Notification) {
        DispatchQueue.main.async {
            self.deviceConnected = true
            self.onDeviceConnected()
        }
    }
    
    @objc private func connectionLost(_ notification: Notification) {
        DispatchQueue.main.async {
            self.deviceConnected = false
            self.onConnectionLost()
        }
    }
    
    func onDeviceConnected() {
        print("onDeviceConnected")
    }
    
    func onConnectionLost() {
        print("onConnectionLost")
    }
}
