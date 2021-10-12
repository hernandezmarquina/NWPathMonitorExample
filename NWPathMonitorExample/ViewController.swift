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
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondController") as! SecondController
        
        self.present(vc, animated: true, completion: nil)
    }
    
}

