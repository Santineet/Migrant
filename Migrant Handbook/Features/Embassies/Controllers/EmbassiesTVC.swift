//
//  EmbassiesTVC.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/10/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

class EmbassiesTVC: UITableViewController {
    
    private var searchController: UISearchController?
    
    private var embassies: [EmbassiesModel] {
        let embassies = Database.shared.embassies
        return embassies
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Посольство" 
        tableView.register(EmbassiesTVCell.nib, forCellReuseIdentifier: EmbassiesTVCell.identifier)
        tableView.tableFooterView = UIView(frame: .zero)
        setupSearchController()
    }
    
    private func setupSearchController() {
        let resultsController = EmbassiesSearchTVC()
        resultsController.delegate = self
        searchController = UISearchController(searchResultsController: resultsController)
        searchController!.hidesNavigationBarDuringPresentation = false
        searchController!.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        let searchBar = searchController!.searchBar
        searchBar.sizeToFit()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.placeholder = "Поиск"
        searchController!.searchResultsUpdater = resultsController
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return embassies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: EmbassiesTVCell.self, forIndexPath: indexPath)
        cell.setData(emmbassies: self.embassies[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.createVC(controllerType: EmbassiesDetailTVC.self, storyboard: .main)
        vc.embassies = self.embassies[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension EmbassiesTVC: EmbassiesSearchTVCDelegate {
    func embassiesSearchDelegate(_ controller: EmbassiesSearchTVC, didSelectEmbassies embassies: EmbassiesModel) {
        let vc = UIStoryboard.createVC(controllerType: EmbassiesDetailTVC.self, storyboard: .main)
        vc.embassies = embassies
        navigationController?.pushViewController(vc, animated: true)
    }
}
