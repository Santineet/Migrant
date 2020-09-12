//
//  ListOfNKOCountryTVC.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/11/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

class ListOfNKOCountryTVC: UITableViewController {
    
    private var regions: [RegionModel] {
        let regions = Database.shared.regions
        return regions
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "НКО"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = regions[indexPath.row].name
        cell.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.createVC(controllerType: NKODetailTVC.self, storyboard: .main)
        vc.id = self.regions[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Выберите регион из списка"
    }
}
