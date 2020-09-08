//
//  HomepageCell.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/25/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class HomepageCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    public func setupCell(type: HomepageOptionsType) -> HomepageCell {
        iconImageView.image = type.values.icon
        titleLabel.text = type.values.title
        
        return self
    }

}
