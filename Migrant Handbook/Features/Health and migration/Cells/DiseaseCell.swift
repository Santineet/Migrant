//
//  DiseaseCell.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/5/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class DiseaseCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewImageview: UIImageView!

    public func setupCell(disease: DiseasesModel) -> DiseaseCell {
        titleLabel.text = disease.title
        previewImageview.image = UIImage(named: disease.image)
        return self
    }
}
