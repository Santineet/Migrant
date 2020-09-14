//
//  HotLinesTVCell.swift
//  Migrant Handbook
//
//  Created by Айрапетова Галина on 9/8/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class HotLinesTVCell: UITableViewCell {
    
    @IBOutlet weak var hotLinesImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(hotLineCountry: HotLineCountryModel) {
        self.nameLabel.text = hotLineCountry.country
        self.hotLinesImageView.image = UIImage(named: hotLineCountry.image)
    }
}
