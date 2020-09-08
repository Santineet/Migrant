//
//  RulesOfStayCell.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/26/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class RulesOfStayCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    public func setupCell(title: String) -> RulesOfStayCell {
        self.titleLabel.text = title
        return self
    }
}
