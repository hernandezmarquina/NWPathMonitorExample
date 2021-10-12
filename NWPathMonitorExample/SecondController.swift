//
//  SecondController.swift
//  NWPathMonitorExample
//
//  Created by Jonathan Hernandez on 12/10/21.
//

import Foundation
import UIKit

class SecondController: InternetConnectionController {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        if deviceConnected {
            errorLabel.text = ""
            dismiss(animated: true, completion: nil)
        } else {
            errorLabel.text = "Sin conexión a internet"
        }
    }
    
}
