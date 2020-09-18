//
//  EmbassiesConsuleTVCell.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/14/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class EmbassiesConsuleTVCell: UITableViewCell {
    
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(consulate: ConsulateModel) {
        self.regionLabel.text = consulate.region
        self.addressLabel.text = consulate.address
        self.phoneNumberLabel.text = consulate.phoneNumber
    }
    
}
