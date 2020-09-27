//
//  AboutTVC.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/26/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class AboutProjectTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = LocalizationManager.sharedInstance.localizedStringForKey(key: "ac_about_project", comment: "")
        //tableView.separatorColor = .blueColor
        tableView.tableFooterView = UIView(frame: .zero)
    }
}
