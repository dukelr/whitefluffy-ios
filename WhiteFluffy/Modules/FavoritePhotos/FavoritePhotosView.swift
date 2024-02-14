
//  FavoritePhotosView.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

private enum Constant {
    static let emptyPlaceholderLabelText = "No favorite photos"
}

final class FavoritePhotosView: UIView {
    private(set) var tableView: UITableView = {
        let tableView = UITableView().prepareToAutoLayout()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .black
        tableView.register(FavoritePhotoTableViewCell.self)
        return tableView
    }()
    
    private(set) var emptyPlaceholderLabel = WFEmptyPlaceholderLabel(text: Constant.emptyPlaceholderLabelText).prepareToAutoLayout()
        
    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) { nil }
    
    private func setupUI() {
        backgroundColor = .black
        
        addSubview(tableView)
        addSubview(emptyPlaceholderLabel)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: WFConstant.Layout.margin
            ),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            emptyPlaceholderLabel.topAnchor.constraint(equalTo: topAnchor),
            emptyPlaceholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyPlaceholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyPlaceholderLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
