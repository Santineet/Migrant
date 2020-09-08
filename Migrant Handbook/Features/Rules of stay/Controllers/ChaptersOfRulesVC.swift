//
//  ChaptersOfRulesVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/26/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class ChaptersOfRulesVC: UIViewController {
    
    enum RulesType {
        case eaes
        case otherCountries
    }
    
    public var rulesType: RulesType = .eaes
    
    private var tableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9921568627, alpha: 1)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.tableFooterView = UIView()
        return tv
    }()

    public var countryID: Int = 0
    
    private var eaesRules: [EaesRulesModel] {
        let rules = Database.shared.eaesRules.filter { $0.country.id == countryID }
        return rules
    }
    
    private var rulesOfIncoming: [RulesOfIncomingModel] {
        let rules = Database.shared.rulesOfIncoming.filter { $0.country.id == countryID }
        return rules
    }

    private var chapters: [String] {
        switch rulesType {
        case .eaes:
            return eaesRules.map { $0.title }
        case .otherCountries:
            return rulesOfIncoming.map { $0.title }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
        setupNavigationItem()
    }
    
    private func setupView() {
        self.view.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9921568627, alpha: 1)
        self.view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
            .isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
            .isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
            .isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            .isActive = true
    }
    
    private func setupTableView() {
        tableView.register(ChapterCell.nib, forCellReuseIdentifier: ChapterCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigationItem() {
        let eaesRules = Database.shared.eaesRules.filter { $0.country.id == countryID }
        navigationItem.title = eaesRules.first?.country.name
    }
}

extension ChaptersOfRulesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: ChapterCell.self, forIndexPath: indexPath)
        return cell.setupCell(title: chapters[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let webViewVC = WebViewVC()
        switch rulesType {
        case .eaes:
            webViewVC.content = eaesRules[indexPath.row].content
            webViewVC.title = eaesRules[indexPath.row].country.name
        case .otherCountries:
            webViewVC.content = rulesOfIncoming[indexPath.row].content
            webViewVC.title = rulesOfIncoming[indexPath.row].country.name
        }
        
        navigationController?.pushViewController(webViewVC, animated: true)
    }
}
