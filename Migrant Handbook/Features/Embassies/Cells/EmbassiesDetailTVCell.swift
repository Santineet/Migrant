//
//  EmbassiesDetailTVCell.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/14/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class EmbassiesDetailTVCell: UITableViewCell {

    @IBOutlet weak var embassiesimageView: UIImageView!
    @IBOutlet weak var embassiesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(value: String, imageName: String) {
        self.embassiesLabel.text = value
        self.embassiesimageView.image = UIImage(named: imageName)
    }
    
}
