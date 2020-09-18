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
    
    private var hotLines: [HotLinesModel] {
        let hotLines = Database.shared.hotLines
        return hotLines
    }
    
    private var phoneNumber: String = ""
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = LocalizationManager.sharedInstance.localizedStringForKey(key: "bt_hot_line", comment: "")
        guard let idNotNil = self.id else { return }
        let hotLine = hotLines.filter { hotLine in
            if hotLine.id == idNotNil {
                return true
            }
            return false
        }
        
        self.phoneNumber = hotLine.first?.phoneNumber ?? ""
        self.phoneNumberLabel.text = self.phoneNumber
    }
    
    @IBAction func callButtonTaped(_ sender: UIButton) {
        callTo(number: phoneNumber)
    }
    
}
