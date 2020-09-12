//
//  ListNKOTVCell.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/12/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

protocol ListNKOTVCellDelegate: class {
    func clickManagerView(manager: String)
    func clickAddressView(address: String)
    func clickPhoneNumberView(phoneNumber: String, secondPhoneNumber: String)
    func clickEmailView(email: String)
}

class ListNKOTVCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var managerLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberStackView: UIStackView!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var managerView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var phoneNumbersView: UIView!
    @IBOutlet weak var emailView: UIView!
    
    weak var delegate: ListNKOTVCellDelegate?
    
    private var nko: NKOModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTargets()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(nko: NKOModel) {
        self.titleLabel.text = nko.title
        self.managerLabel.text = nko.manager
        self.addressLabel.text = nko.address
        self.mailLabel.text = nko.mail
        self.descriptionLabel.text = nko.text
        
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 13)
        phoneNumberLabel.textColor = .lightGray
        phoneNumberLabel.text = nko.phoneNumber
        if !nko.phoneNumber.isEmpty {
            self.phoneNumberStackView.addArrangedSubview(phoneNumberLabel)
        }
        
        let phoneNumberLabelSecond = UILabel()
        phoneNumberLabelSecond.font = UIFont.systemFont(ofSize: 13)
        phoneNumberLabelSecond.textColor = .lightGray
        phoneNumberLabelSecond.text = nko.phoneNumberSecond
        if !nko.phoneNumberSecond.isEmpty {
            self.phoneNumberStackView.addArrangedSubview(phoneNumberLabelSecond)
        }
        self.nko = nko
    }
    
    private func setupTargets() {
        self.managerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapedManagerView)))
        self.addressView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapedAddressView)))
        self.phoneNumbersView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapedPhoneNumbersView)))
        self.emailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapedEmailView)))
    }
    
    @objc func tapedManagerView() {
        if let delegate = self.delegate {
            delegate.clickManagerView(manager: self.nko?.manager ?? "")
        }
    }
    @objc func tapedAddressView() {
        if let delegate = self.delegate {
            delegate.clickAddressView(address: self.nko?.address ?? "")
        }
    }
    @objc func tapedPhoneNumbersView() {
        if let delegate = self.delegate {
            delegate.clickPhoneNumberView(phoneNumber: self.nko?.phoneNumber ?? "",
                                          secondPhoneNumber: self.nko?.phoneNumberSecond ?? "")
        }
    }
    @objc func tapedEmailView() {
        if let delegate = self.delegate {
            delegate.clickEmailView(email: self.nko?.mail ?? "")
        }
    }
}
