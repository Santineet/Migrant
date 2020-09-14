//
//  EmbassiesSearchTVC.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/10/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

protocol EmbassiesSearchTVCDelegate: class {
    func embassiesSearchDelegate(_ controller: EmbassiesSearchTVC, didSelectEmbassies embassies: EmbassiesModel)
}

class EmbassiesSearchTVC: UITableViewController {
    
    weak var delegate: EmbassiesSearchTVCDelegate?
    
    private var filterEmbassies: [EmbassiesModel] = []
    private var embassies: [EmbassiesModel] {
        let embassies = Database.shared.embassies
        return embassies
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(EmbassiesTVCell.nib, forCellReuseIdentifier: EmbassiesTVCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterEmbassies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: EmbassiesTVCell.self, forIndexPath: indexPath)
        cell.setData(emmbassies: self.filterEmbassies[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            delegate.embassiesSearchDelegate(self, didSelectEmbassies: self.embassies[indexPath.row])
        }
    }
}
extension EmbassiesSearchTVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchBarText = searchController.searchBar.text else { return }
        filterEmbassies = embassies.filter { $0.country.lowercased().contains(searchBarText.lowercased()) }
        if filterEmbassies.isEmpty {
            filterEmbassies.append(contentsOf: self.embassies)
        }
        self.tableView.reloadData()
    }
}
