//
//  PolingPlaceDetailVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/14/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit
import FittedSheets

class PolingPlaceDetailVC: UIViewController {

    @IBOutlet weak var numberOfPlaceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var phoneNumber1Button: UIButton!
    @IBOutlet weak var phoneNumber2Button: UIButton!

    public var polingPlace = PolingPlaceResultModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfPlaceLabel.text = "№ \(polingPlace.placeNumber)"
        nameLabel.text = polingPlace.title
        addressLabel.text = polingPlace.address
        emailButton.setTitle(polingPlace.email, for: .normal)
        phoneNumber1Button.setTitle(polingPlace.phoneNumber1, for: .normal)
        phoneNumber2Button.setTitle(polingPlace.phoneNumber2, for: .normal)
    }
    
    @IBAction func closeTapped(_ sender: UIButton) {
        sheetViewController?.closeSheet()
    }

    @IBAction func callPhoneNumber1Tapped(_ sender: UIButton) {
        callTo(number: polingPlace.phoneNumber1)
    }
    
    
    @IBAction func callPhoneNumber2Tapped(_ sender: UIButton) {
        callTo(number: polingPlace.phoneNumber2)
    }
    
    @IBAction func openEmailTapped(_ sender: UIButton) {
        if let url = URL(string: "mailto:\(polingPlace.email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
