//
//  AboutApp.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/10/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

class AboutAppTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = LocalizationManager.sharedInstance.localizedStringForKey(key: "ac_about_project", comment: "")
        tableView.separatorColor = .blueColor
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    @IBAction func phoneButtonTaped(_ sender: UIButton) {
        callTo(number: "312735")
    }
    
}
