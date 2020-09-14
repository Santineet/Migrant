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
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var faxLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var siteLabel: UILabel!
    
    var embassies: EmbassiesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Посольство"
        tableView.tableFooterView = UIView(frame: .zero)
        setData()
    }
    
    private func setData() {
        if let embassiesNotNil = self.embassies {
            self.phoneNumberLabel.text = embassiesNotNil.phoneNumber
            self.faxLabel.text = embassiesNotNil.fax
            self.addressLabel.text = embassiesNotNil.address
            self.siteLabel.text = embassiesNotNil.site
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            callTo(number: self.embassies?.phoneNumber ?? "")
        case 1:
            callTo(number: self.embassies?.fax ?? "")
        case 2:
            self.openAddress()
        case 3:
            self.openWebPage(url: self.embassies?.site ?? "")
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.embassies?.country
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
}
