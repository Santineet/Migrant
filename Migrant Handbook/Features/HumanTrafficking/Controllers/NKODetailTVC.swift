//
//  NKODetailTVC.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/12/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

class NKODetailTVC: UITableViewController {
    
    private var listNKO: [NKOModel] {
        let listNKO = Database.shared.listNKO
        return listNKO
    }
    private var filteredListNKO = [NKOModel]()
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let idNotNil = self.id else { return }
        filteredListNKO = listNKO.filter { nko in
            return nko.region.id == idNotNil
        }
        navigationItem.title = "НКО"
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(ListNKOTVCell.nib, forCellReuseIdentifier: ListNKOTVCell.identifier)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredListNKO.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: ListNKOTVCell.self, forIndexPath: indexPath)
        cell.delegate = self
        cell.setData(nko: self.filteredListNKO[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func share(shareLink: String) {
        let activityViewController = UIActivityViewController (
            activityItems: [shareLink], applicationActivities: nil)
        present(activityViewController,
                animated: true,
                completion: {})
    }
    
    func alertAction(phoneNumber: String, secondPhoneNumber: String) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { action in
//            self.dismiss(animated: true, completion: nil)
        }
        let phoneNumberAction = UIAlertAction(title: phoneNumber, style: .default) { action in
            callTo(number: phoneNumber)
        }
        let secondPhoneNumberAction = UIAlertAction(title: secondPhoneNumber, style: .default) { action in
            callTo(number: secondPhoneNumber)
        }
        alert.addAction(secondPhoneNumberAction)
        alert.addAction(phoneNumberAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    func showAlertWithMessage(title: String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension NKODetailTVC: ListNKOTVCellDelegate {
    func clickManagerView(manager: String) {
        print(manager)
    }
    
    func clickAddressView(address: String) {
        UIPasteboard.general.string = address
        self.showAlertWithMessage(title: "Скопировано")
    }
    
    func clickPhoneNumberView(phoneNumber: String, secondPhoneNumber: String) {
        self.alertAction(phoneNumber: phoneNumber, secondPhoneNumber: secondPhoneNumber)
    }
    
    func clickEmailView(email: String) {
        self.share(shareLink: email)
    }
}
