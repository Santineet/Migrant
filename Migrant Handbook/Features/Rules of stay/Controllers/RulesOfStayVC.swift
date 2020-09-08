//
//  RulesOfStayVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/25/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

enum RulesType {
    case ru
    case kz
    case eaeu
    case otherCountries
    case news
    case questions
    
    var localeKey: String {
        switch self {
        case .ru:
            return "Порядок вьезда и пребывания граждан КР в РФ"
        case .kz:
            return "Порядок вьезда и пребывания граждан КР в РК"
        case .otherCountries:
            return "Порядок вьезда и пребывания граждан КР в других странах"
        case .eaeu:
            return "Трудовая деятельность и социальное обеспечение в странах ЕАЭС"
        case .news:
            return "Новости миграции"
        case .questions:
            return "Часто задаваемые вопросы"
        }
    }
}

class RulesOfStayVC: UIViewController {
        
    private var tableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.tableFooterView = UIView()
        return tv
    }()

    let rows: [RulesType] = [.ru, .kz, .eaeu, .otherCountries, .news, .questions]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
        setupNavigationItem()
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Правила пребывания за рубежом"
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(RulesOfStayCell.nib,
                           forCellReuseIdentifier: RulesOfStayCell.identifier)
    }
}

extension RulesOfStayVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: RulesOfStayCell.self, forIndexPath: indexPath)
        return cell.setupCell(title: rows[indexPath.row].localeKey)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch rows[indexPath.row] {
        case .ru:
            showChaptersOfRules(id: 6)
        case .kz:
            showChaptersOfRules(id: 8)
        case .eaeu:
            showChaptersOfRules(id: 7)
        case .otherCountries:
            let otherCountriesVC = UIStoryboard.createVC(controllerType: RulesOfStayInOtherCountriesTVC.self, storyboard: .main)
            navigationController?.pushViewController(otherCountriesVC, animated: true)
        case .news:
            let newsTVC = NewsTVC()
            navigationController?.pushViewController(newsTVC, animated: true)
        case .questions:
            let questionsVC = QuestionTitlesTVC()
            navigationController?.pushViewController(questionsVC, animated: true)
        }
    }
    
    private func showChaptersOfRules(id: Int) {
        let chaptersVC = ChaptersOfRulesVC()
        chaptersVC.countryID = id
        chaptersVC.rulesType = .eaes
        navigationController?.pushViewController(chaptersVC, animated: true)
    }
}
