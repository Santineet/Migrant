//
//  HotLinesDetailVC.swift
//  Migrant Handbook
//
//  Created by Айрапетова Галина on 9/8/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

class HotLinesDetailVC: UIViewController {
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var phoneNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Горячие Линии"
        phoneNumberLabel.text = phoneNumber
    }
    
    @IBAction func callButtonTaped(_ sender: UIButton) {
        callTo(number: phoneNumber ?? "")
    }
    
}
