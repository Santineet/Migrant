//
//  UITableViewCell + Helper.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/25/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }

    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    var tableView: UITableView? {
        return self.next(of: UITableView.self)
    }
    
    var indexPath: IndexPath? {
        return self.tableView?.indexPath(for: self)
    }
    
}

