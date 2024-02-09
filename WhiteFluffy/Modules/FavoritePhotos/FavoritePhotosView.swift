
//  FavoritePhotosView.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

private enum Constant {
    static let emptyPlaceholderLabelText = "No favorite photos"
    static let emptyPlaceholderLabelFontSize: CGFloat = 24
}

final class FavoritePhotosView: UIView {
    private(set) var tableView: UITableView = {
        let tableView = UITableView().prepareToAutoLayout()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(FavoritePhotoTableViewCell.self)
        return tableView
    }()
    
    private(set) var emptyPlaceholderLabel: UILabel = {
        let label = UILabel().prepareToAutoLayout()
        label.text = Constant.emptyPlaceholderLabelText
        label.font = .boldSystemFont(ofSize: Constant.emptyPlaceholderLabelFontSize)
        label.numberOfLines = .zero
        label.textAlignment = .center
        return label
    }()
    
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
            emptyPlaceholderLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}