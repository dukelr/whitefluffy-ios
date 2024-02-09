//
//  UIView+Layout.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

private enum Constant {
    static let borderWidth: CGFloat = 1
    static let cornerRadius: CGFloat = 8
}

extension UIView {
    func prepareToAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func setRoundedBorder(
        cornerRadius: CGFloat = Constant.cornerRadius,
        borderWidth: CGFloat = Constant.borderWidth,
        borderColor: UIColor = .darkGray
    ) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
