//
//  HumanTraffickingTVCell.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/11/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class HumanTraffickingTVCell: UITableViewCell {
    
    @IBOutlet weak var humanTraffickingImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(humanTrafficking: HumanTraffickingModel) {
        self.titleLabel.text = humanTrafficking.title
        self.humanTraffickingImageView.image = UIImage(named: humanTrafficking.image)
    }
    
}
