//
//  WFLoaderView.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import UIKit

private enum Constant {
    static let alpha: CGFloat = 0.1
}

final class WFLoaderView: UIView {
    private let activityIndicator: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView().prepareToAutoLayout()
        indicatorView.color = .white
        indicatorView.backgroundColor = .black.withAlphaComponent(Constant.alpha)
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    
    init(style: UIActivityIndicatorView.Style = .large) {
        super.init(frame: .zero)
        setupUI(style: style)
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func setupUI(style: UIActivityIndicatorView.Style) {
        isHidden = true
        
        activityIndicator.style = style

        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: topAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func startLoading() {
        isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        isHidden = true
        activityIndicator.stopAnimating()
    }
}
