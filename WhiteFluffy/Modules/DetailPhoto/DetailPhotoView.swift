
//  DetailPhotoView.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

final class DetailPhotoView: UIView {
    private(set) var tableView: UITableView = {
        let tableView = UITableView().prepareToAutoLayout()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.alwaysBounceVertical = false
        tableView.register(DetailPhotoTableViewCell.self)
        return tableView
    }()
    
    private(set) var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium).prepareToAutoLayout()
        activityIndicatorView.color = .white
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) { nil }
    
    private func setupUI() {
        backgroundColor = .black
        
        addSubview(tableView)
        addSubview(activityIndicatorView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: WFConstant.Layout.margin
            ),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            activityIndicatorView.topAnchor.constraint(equalTo: tableView.topAnchor),
            activityIndicatorView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            activityIndicatorView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            activityIndicatorView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
    }
}
