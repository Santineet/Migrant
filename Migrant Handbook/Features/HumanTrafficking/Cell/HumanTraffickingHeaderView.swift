//
//  HumanTraffickingHeaderView.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/11/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

protocol HumanTraffickingHeaderViewDelegate: class {
    func clickMoreButton()
}

class HumanTraffickingHeaderView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    
    weak var delegate: HumanTraffickingHeaderViewDelegate?
    
    override func draw(_ rect: CGRect) {
        containerView.backgroundColor = .white
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowRadius = 2.0
        containerView.layer.masksToBounds = false
    }
    

    @IBAction func tapedMoreButton(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.clickMoreButton()
        }
    }
    
}
