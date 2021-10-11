//
//  ViewController.swift
//  NWPathMonitorExample
//
//  Created by Jonathan Hernandez on 11/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var connectionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(deviceConnected(_:)), name: .connected, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(connectionLost(_:)), name: .connectionLost, object: nil)
    }
    
    @objc func deviceConnected(_ notification: Notification) {
        updateLabel(text: "Dispositivo conectado")
    }
    
    @objc func connectionLost(_ notification: Notification) {
        updateLabel(text: "Dispositivo sin conexión")
    }
    
    func updateLabel(text: String) {
        DispatchQueue.main.async { [self] in
            self.connectionLabel.text = text
        }
    }

}

