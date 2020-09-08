//
//  RulesOfOtherCountriesTVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/30/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class RulesOfStayInOtherCountriesTVC: UITableViewController {

    private var rulesOfIncoming: [RulesOfIncomingModel] {
        let rules = Database.shared.rulesOfIncoming
        return rules
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }

    private func showChaptersOfRules(id: Int) {
        let chaptersVC = ChaptersOfRulesVC()
        chaptersVC.countryID = id
        chaptersVC.rulesType = .otherCountries
        navigationController?.pushViewController(chaptersVC, animated: true)
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            showChaptersOfRules(id: 2)
        case 1:
            showChaptersOfRules(id: 6)
        case 2:
            showChaptersOfRules(id: 5)
        case 3:
            showChaptersOfRules(id: 4)
        default: break
        }
    }
}
