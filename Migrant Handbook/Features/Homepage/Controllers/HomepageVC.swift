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
            return (LocalizationManager.sharedInstance.localizedStringForKey(key: "bt_abroad", comment: ""), #imageLiteral(resourceName: "ic_rules"))
        case .employment:
            return (LocalizationManager.sharedInstance.localizedStringForKey(key: "bt_employment", comment: ""), #imageLiteral(resourceName: "ic_telecommuting"))
        case .embassies:
            return (LocalizationManager.sharedInstance.localizedStringForKey(key: "bt_embassy", comment: ""), #imageLiteral(resourceName: "ic_hotel"))
        case .map:
            return (LocalizationManager.sharedInstance.localizedStringForKey(key: "maptext", comment: ""), #imageLiteral(resourceName: "ic_map"))
        case .humanTrafficking:
            return (LocalizationManager.sharedInstance.localizedStringForKey(key: "bt_ht", comment: ""), #imageLiteral(resourceName: "ic_human"))
        case .hotLines:
            return (LocalizationManager.sharedInstance.localizedStringForKey(key: "bt_hot_line", comment: ""), #imageLiteral(resourceName: "ic_phone"))
        case .healthAndMigration:
            return (LocalizationManager.sharedInstance.localizedStringForKey(key: "bt_eaeu", comment: ""), #imageLiteral(resourceName: "ic_doctor"))
        case .aboutProject:
            return (LocalizationManager.sharedInstance.localizedStringForKey(key: "ac_about_project", comment: ""), #imageLiteral(resourceName: "ic_info"))
        }
    }
}

class HomepageVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let localizationManager = LocalizationManager.sharedInstance
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
        titleLabel.text = localizationManager.localizedStringForKey(key: "app_name", comment: "")
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        titleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: localizationManager.localizedStringForKey(key: "language", comment: ""), style: .plain, target: self, action: #selector(tapedLanguageButton))
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
    
    @objc func tapedLanguageButton() {
        self.alertAction()
    }
    
    func alertAction() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                
        let cancelAction = UIAlertAction(title: localized(key: "cancel", comment: ""), style: .cancel, handler: nil)
        
        let ruAction = UIAlertAction(title: "Русский", style: .default) { action in
            LocalizationManager.sharedInstance.setLanguage(languageCode: "ru")
            AppSettings.currentLanguage = "ru"
            Database.shared.prepareData()
            self.updateRootVC()
        }
        let kgAction = UIAlertAction(title: "Кыргызча", style: .default) { action in
            LocalizationManager.sharedInstance.setLanguage(languageCode: "ky-KG")
            AppSettings.currentLanguage = "kg"
            Database.shared.prepareData()
            self.updateRootVC()
        }
        alert.addAction(ruAction)
        alert.addAction(kgAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    private func updateRootVC() {
        guard let windowScene = UIApplication.shared.connectedScenes.first
            as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate
            else { return }
        let homepageVC = UIStoryboard.createVC(controllerType: HomepageVC.self, storyboard: .main)
        sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: homepageVC)
        sceneDelegate.window?.makeKeyAndVisible()

    }
    
    func localized(key: String, comment: String = "") -> String {
        return localizationManager.localizedStringForKey(key: key, comment: comment)
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
            self.openEmploymentSite()
        case .embassies:
            let embassiesTVC = UIStoryboard.createVC(controllerType: EmbassiesTVC.self, storyboard: .main)
            navigationController?.pushViewController(embassiesTVC, animated: true)
        case .map:
            let mapVC = UIStoryboard.createVC(controllerType: MapVC.self,
                                              storyboard: .main)
            navigationController?.pushViewController(mapVC, animated: true)
        case .humanTrafficking:
            let humanTraffickingTVC = UIStoryboard.createVC(controllerType: HumanTraffickingTVC.self, storyboard: .main)
            navigationController?.pushViewController(humanTraffickingTVC, animated: true)
        case .hotLines:
            let hotLinesVC = UIStoryboard.createVC(controllerType: HotLinesVC.self, storyboard: .main)
            navigationController?.pushViewController(hotLinesVC, animated: true)
        case .healthAndMigration:
            let healthAndMigrationTVC = UIStoryboard.createVC(controllerType: HealthAndMigrationTVC.self, storyboard: .main)
            navigationController?.pushViewController(healthAndMigrationTVC, animated: true)
        case .aboutProject:
            let aboutProjectVC = UIStoryboard.createVC(controllerType: AboutProjectTVC.self, storyboard: .main)
            navigationController?.pushViewController(aboutProjectVC, animated: true)
            break
        }
    }
    
    private func openEmploymentSite() {
        guard let webURL = URL(string: "http://oec.kg/index.php?act=view_material&id=1342") else {
            return
        }
        UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
    }
}

extension HomepageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 48) / 2, height: (collectionView.frame.height - 72) / 4)
    }
}
