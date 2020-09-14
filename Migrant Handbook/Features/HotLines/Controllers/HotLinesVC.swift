//
//  HotLinesVC.swift
//  Migrant Handbook
//
//  Created by Айрапетова Галина on 9/8/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

class HotLinesVC: UIViewController {
    
    @IBOutlet weak var kgHotLineView: UIView!
    @IBOutlet weak var hotLinesTableView: UITableView!
    
    private var hotLinesCountry: [HotLineCountryModel] {
        let hotLinesCountry = Database.shared.hotLinesCountry
        return hotLinesCountry
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Горячие Линии"
        setupTableView()
        kgHotLineView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapedKGHotLineView)))
    }
    
    private func setupTableView() {
        hotLinesTableView.delegate = self
        hotLinesTableView.dataSource = self
        hotLinesTableView.register(HotLinesTVCell.nib, forCellReuseIdentifier: HotLinesTVCell.identifier)
        hotLinesTableView.tableFooterView = UIView(frame: .zero)
        hotLinesTableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
    
    @objc private func tapedKGHotLineView() {
        let vc = UIStoryboard.createVC(controllerType: KGHotLinesDetailVC.self, storyboard: .main)
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension HotLinesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotLinesCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: HotLinesTVCell.self, forIndexPath: indexPath)
        cell.setData(hotLineCountry: self.hotLinesCountry[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.createVC(controllerType: HotLinesDetailVC.self, storyboard: .main)
        vc.id = self.hotLinesCountry[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
}
