//
//  QuestionTitleCell.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/1/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class QuestionTitleCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        mainView.dropShadow()
    }
    
    public func setupCell(title: String) -> QuestionTitleCell {
        titleLabel.text = title
        return self
    }
}
