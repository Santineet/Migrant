//
//  KgHotLinesDetailVC.swift
//  Migrant Handbook
//
//  Created by Айрапетова Галина on 9/8/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

class KGHotLinesDetailVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Горячие Линии"
    }
    
    @IBAction func callButtonTaped(_ sender: UIButton) {
        callTo(number: "08000000189")
    }
}
