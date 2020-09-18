//
//  NewsTVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/1/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class NewsTVC: UITableViewController {

    let rows = ["oes.kg", "traffikunet.kg", "mfa.gov.kg", "mlsp.gov.kg", "smm.gov.kg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = LocalizationManager.sharedInstance.localizedStringForKey(key: "news", comment: "")
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(NewsCell.nib, forCellReuseIdentifier: NewsCell.identifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: NewsCell.self, forIndexPath: indexPath)
        return cell.setupCell(title: rows[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
