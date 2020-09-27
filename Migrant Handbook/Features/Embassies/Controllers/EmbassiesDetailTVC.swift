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
        navigationItem.title = LocalizationManager.sharedInstance.localizedStringForKey(key: "ac_embassy", comment: "")
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(EmbassiesDetailTVCell.nib, forCellReuseIdentifier: EmbassiesDetailTVCell.identifier)
        tableView.register(EmbassiesConsuleTVCell.nib, forCellReuseIdentifier: EmbassiesConsuleTVCell.identifier)
        guard let regionId = self.embassies?.id else { return }
        filteredConsule = consules.filter { consulate in
            if consulate.embassies.id == regionId {
                return true
            }
            return false
        }
        if filteredConsule.count != 0 {
            consuleSectionTitle = LocalizationManager.sharedInstance.localizedStringForKey(key: "tv_embassy_consulate", comment: "")
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
            return filteredConsule.count
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
            case 3: return getTableViewCell(indexPath: indexPath, value: self.embassies?.site ?? "", imageName: "www")
            default:
                return UITableViewCell()
            }
        case 1: return getConsuleTableViewCell(indexPath: indexPath, consules: self.filteredConsule)
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
        case 1:
            callTo(number: self.filteredConsule[indexPath.row].phoneNumber)
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
        self.openWebPage(url: self.embassies?.mapLink ?? "")
    }
    
    private func openWebPage(url: String) {
        var httpUrl = url
        if !url.contains("http://") {
            httpUrl = "http://" + url
        }
        if let webURL = URL(string: httpUrl), UIApplication.shared.canOpenURL(webURL) {
            UIApplication.shared.open(webURL)
        } else if let webURL = URL(string: "https://www.google.com.au/search?client=safari&channel=ipad_bm&source=hp&ei=PSrkWqHVDYrc8QXp85zoAw&q=\(httpUrl)&oq=example&gs_l=mobile-gws-wiz-hp.3..0l5.58620.59786..60164...0....334.1724.0j2j3j2..........1.......3..41j0i131.SurD5PmVspw%3D") {
            UIApplication.shared.open(webURL)
        }
    }
    
    private func getTableViewCell(indexPath: IndexPath, value: String, imageName: String) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: EmbassiesDetailTVCell.self, forIndexPath: indexPath)
        cell.setData(value: value, imageName: imageName)
        return cell
    }
    
    private func getConsuleTableViewCell(indexPath: IndexPath, consules: [ConsulateModel]) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: EmbassiesConsuleTVCell.self, forIndexPath: indexPath)
        cell.setData(consulate: self.filteredConsule[indexPath.row])
        return cell
    }
}
