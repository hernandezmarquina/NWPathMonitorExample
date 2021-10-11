//
//  ViewController.swift
//  NWPathMonitorExample
//
//  Created by Jonathan Hernandez on 11/10/21.
//

import UIKit

class ViewController: InternetConnectionController {

    @IBOutlet weak var connectionLabel: UILabel!
    
    override func onConnectionLost() {
        connectionLabel.text = "Dispositivo sin conexión"
    }
    
    override func onDeviceConnected() {
        connectionLabel.text = "Dispositivo conectado"
    }
}

