//
//  HumanTraffickingTVC.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/11/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

class HumanTraffickingTVC: UITableViewController {
    
    var headerView = UINib(nibName: "HumanTraffickingHeaderView", bundle: nil)
                    .instantiate(withOwner: nil, options: nil).first as! HumanTraffickingHeaderView
    
    private var humanTrafficking: [HumanTraffickingModel] {
        let humanTrafficking = Database.shared.humanTrafficking
        return humanTrafficking
    }
    private let localizationManager = LocalizationManager.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = localizationManager.localizedStringForKey(key: "bt_ht", comment: "")
        tableView.register(HumanTraffickingTVCell.nib, forCellReuseIdentifier: HumanTraffickingTVCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return humanTrafficking.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: HumanTraffickingTVCell.self, forIndexPath: indexPath)
        cell.setData(humanTrafficking: self.humanTrafficking[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView.delegate = self
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webViewVC = WebViewVC()
        webViewVC.content = self.humanTrafficking[indexPath.row].content
        webViewVC.navigationItem.title = localizationManager.localizedStringForKey(key: "bt_ht", comment: "")
        navigationController?.pushViewController(webViewVC, animated: true)
    }
}
extension HumanTraffickingTVC: HumanTraffickingHeaderViewDelegate {
    func clickMoreButton() {
        let vc = UIStoryboard.createVC(controllerType: ListOfNKOCountryTVC.self, storyboard: .main)
        navigationController?.pushViewController(vc, animated: true)
    }
}
