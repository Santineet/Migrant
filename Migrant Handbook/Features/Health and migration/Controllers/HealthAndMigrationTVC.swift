//
//  HealthAndMigrationTVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/3/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class HealthAndMigrationTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = LocalizationManager.sharedInstance.localizedStringForKey(key: "bt_eaeu", comment: "")
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let diseaseInfo = DiseaseTVC()
        switch indexPath.row {
        case 0:
            diseaseInfo.diseases = Database.shared.covidInfo
        case 1:
            diseaseInfo.diseases = Database.shared.tuberkulezInfo
        case 2:
            diseaseInfo.diseases = Database.shared.vichInfo
        default: return
        }
        navigationController?.pushViewController(diseaseInfo, animated: true)
    }
}
