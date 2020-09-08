//
//  GoOverCell.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/1/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

protocol GoOverCellDelegate: class {
    func goOver()
}

class GoOverCell: UITableViewCell {

    weak var delegate: GoOverCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    public func setupCell(delegate: GoOverCellDelegate) -> GoOverCell {
        self.delegate = delegate
        return self
    }
    
    @IBAction func goOverTapped(_ sender: UIButton) {
        delegate?.goOver()
    }
}
