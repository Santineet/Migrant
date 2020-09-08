//
//  DiseaseTVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/5/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class DiseaseTVC: UITableViewController {

    public var diseases: [DiseasesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(DiseaseCell.nib, forCellReuseIdentifier: DiseaseCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diseases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: DiseaseCell.self, forIndexPath: indexPath)
        return cell.setupCell(disease: diseases[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webViewVC = WebViewVC()
        webViewVC.content = diseases[indexPath.row].content
        navigationController?.pushViewController(webViewVC, animated: true)
    }
}
