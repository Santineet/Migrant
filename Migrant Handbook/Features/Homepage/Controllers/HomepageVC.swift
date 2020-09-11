//
//  ViewController.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/24/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

enum HomepageOptionsType {
    case rules
    case employment
    case embassies
    case map
    case humanTrafficking
    case hotLines
    case healthAndMigration
    case aboutProject
    
    var values: (title: String, icon: UIImage) {
        switch self {
        case .rules:
            return ("Правила пребывания за рубежом", #imageLiteral(resourceName: "ic_rules"))
        case .employment:
            return ("Трудоустройство", #imageLiteral(resourceName: "ic_telecommuting"))
        case .embassies:
            return ("Посольства и консульства КР", #imageLiteral(resourceName: "ic_hotel"))
        case .map:
            return ("Карта избирательных участков за рубежом", #imageLiteral(resourceName: "ic_map"))
        case .humanTrafficking:
            return ("Осторожно! Торговля людьми", #imageLiteral(resourceName: "ic_human"))
        case .hotLines:
            return ("Горячие линии", #imageLiteral(resourceName: "ic_phone"))
        case .healthAndMigration:
            return ("Здоровье и миграция", #imageLiteral(resourceName: "ic_doctor"))
        case .aboutProject:
            return ("О проекте", #imageLiteral(resourceName: "ic_info"))
        }
    }
}

class HomepageVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let rows: [HomepageOptionsType] = [.rules, .employment,
                                           .embassies, .map,
                                           .humanTrafficking, .hotLines,
                                           .healthAndMigration, .aboutProject]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItem()
        setupCollectionView()
    }
    
    private func setupNavigationItem() {
        let titleLabel = UILabel()
        titleLabel.text = "Справочник мигранта"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        titleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomepageCell.nib,
                                forCellWithReuseIdentifier: HomepageCell.identifier)
    }
    
    private func showRulesOfStay() {
        let rulesVC = RulesOfStayVC()
        navigationController?.pushViewController(rulesVC, animated: true)
    }
}

extension HomepageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: HomepageCell.self,
                                          forIndexPath: indexPath)
        return cell.setupCell(type: rows[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch rows[indexPath.row] {
        case .rules:
            showRulesOfStay()
        case .employment:
            break
        case .embassies:
            let embassiesTVC = UIStoryboard.createVC(controllerType: EmbassiesTVC.self, storyboard: .main)
            navigationController?.pushViewController(embassiesTVC, animated: true)
        case .map:
            break
        case .humanTrafficking:
            break
        case .hotLines:
            let hotLinesVC = UIStoryboard.createVC(controllerType: HotLinesVC.self, storyboard: .main)
            navigationController?.pushViewController(hotLinesVC, animated: true)
        case .healthAndMigration:
            let healthAndMigrationTVC = UIStoryboard.createVC(controllerType: HealthAndMigrationTVC.self, storyboard: .main)
            navigationController?.pushViewController(healthAndMigrationTVC, animated: true)
        case .aboutProject:
            let aboutProjectVC = UIStoryboard.createVC(controllerType: AboutAppTVC.self, storyboard: .main)
            navigationController?.pushViewController(aboutProjectVC, animated: true)
            break
        }
    }
}

extension HomepageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 48) / 2, height: (collectionView.frame.height - 72) / 4)
    }
}
