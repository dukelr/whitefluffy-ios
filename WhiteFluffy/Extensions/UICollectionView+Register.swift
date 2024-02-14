//
//  UICollectionView+Register.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String { String(describing: self) }
}

extension UICollectionView {
    func register(_ type: UICollectionViewCell.Type) {
        register(
            type.self,
            forCellWithReuseIdentifier: type.identifier
        )
    }
}
