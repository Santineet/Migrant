//
//  EmbassiesConsuleTVCell.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/14/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class EmbassiesConsuleTVCell: UITableViewCell {

    @IBOutlet weak var consuleStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(consulates: [ConsulateModel]) {
        for consulate in consulates {
//            let consulateView =
            //self.consuleStackView.addArrangedSubview(<#T##view: UIView##UIView#>)
        }
    }
    
//    private func getConsulateView(consulate: ConsulateModel) -> UIView {
//        let containerView = UIView()
//
//        let cityLabel = UILabel()
//        cityLabel.translatesAutoresizingMaskIntoConstraints = false
//        cityLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//        cityLabel.text = consulate.region
//
//        containerView.addSubview(cityLabel)
//        cityLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
//
//        let addressLabel = UILabel()
//        addressLabel.translatesAutoresizingMaskIntoConstraints = false
//        addressLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//        addressLabel.text = consulate.address
//
//        return containerView
//    }
    
}
