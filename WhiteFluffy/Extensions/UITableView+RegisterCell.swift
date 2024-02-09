//
//  UITableView+RegisterCell.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

extension UITableViewCell {
    static var identifier: String { String(describing: self) }
}

extension UITableView {
    func register(_ type: UITableViewCell.Type) {
        register(
            type.self,
            forCellReuseIdentifier: type.identifier
        )
    }
}
