//
//  NewsCell.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/3/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    public func setupCell(title: String) -> NewsCell {
        titleLabel.text = title
        return self
    }
    
}
