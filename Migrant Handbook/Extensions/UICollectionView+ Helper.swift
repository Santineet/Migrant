//
//  UICollectionView+ Helper.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/25/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

extension UICollectionView {

    public func dequeue<T: UICollectionViewCell>(cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: cellClass.identifier, for: indexPath) as? T else {
                fatalError(
                    "Error: cell with id: \(cellClass.identifier) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}
