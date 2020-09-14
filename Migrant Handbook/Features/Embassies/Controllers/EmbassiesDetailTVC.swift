//
//  EmbassiesDetailTVC.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/10/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

class EmbassiesDetailTVC: UITableViewController {

    private var consuleSectionTitle: String = ""
    
    private var filteredConsule = [ConsulateModel]()
    private var consules: [ConsulateModel] {
        let consules = Database.shared.consulate
        return consules
    }
    var embassies: EmbassiesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Посольство"
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(EmbassiesDetailTVCell.nib, forCellReuseIdentifier: EmbassiesDetailTVCell.identifier)
        tableView.register(EmbassiesConsuleTVCell.nib, forCellReuseIdentifier: EmbassiesConsuleTVCell.identifier)
        guard let regionId = self.embassies?.id else { return }
        filteredConsule = consules.filter { consulate in
            if consulate.id == regionId {
                return true
            }
            return false
        }
        if filteredConsule.count != 0 {
            consuleSectionTitle = "Консульские отделы"
        }
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 0
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch indexPath.section {
        case 0:
            switch row {
            case 0: return getTableViewCell(indexPath: indexPath, value: self.embassies?.phoneNumber ?? "", imageName: "phone_icon")
            case 1: return getTableViewCell(indexPath: indexPath, value: self.embassies?.fax ?? "", imageName: "fax_icon")
            case 2: return getTableViewCell(indexPath: indexPath, value: self.embassies?.address ?? "", imageName: "location_icon")
            case 3: return getTableViewCell(indexPath: indexPath, value: self.embassies?.site ?? "", imageName: "")
            default:
                return getConsuleTableViewCell(indexPath: indexPath, consules: self.filteredConsule)
            }
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        switch indexPath.section {
        case 0:
            switch row {
            case 0: callTo(number: self.embassies?.phoneNumber ?? "")
            case 1: callTo(number: self.embassies?.fax ?? "")
            case 2: self.openAddress()
            case 3: self.openWebPage(url: self.embassies?.site ?? "")
            default:
                break
            }
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return self.embassies?.country
        case 1:
            return self.consuleSectionTitle
        default:
            return ""
        }
    }
    
    private func openAddress() {
        print("open address")
    }
    
    private func openWebPage(url: String) {
        guard let webURL = URL(string: url) else {
            return
        }
        UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
    }
    
    private func getTableViewCell(indexPath: IndexPath, value: String, imageName: String) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: EmbassiesDetailTVCell.self, forIndexPath: indexPath)
        cell.setData(value: value, imageName: imageName)
        return cell
    }
    
    private func getConsuleTableViewCell(indexPath: IndexPath, consules: [ConsulateModel]) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: EmbassiesConsuleTVCell.self, forIndexPath: indexPath)
        
        return cell
    }
}
