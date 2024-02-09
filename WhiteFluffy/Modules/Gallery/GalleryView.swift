
//  GalleryView.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

private enum Constant {
    static let galleryButtonTitle = "Show Unsplash Photos"
}

final class GalleryView: UIView {
    let actionHandler: ActionHandler
    
    private lazy var galleryButton: UIButton = {
        let button = UIButton().prepareToAutoLayout()
        button.setRoundedBorder()
        button.setTitle(
            Constant.galleryButtonTitle,
            for: []
        )
        button.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                
                actionHandler.galleryButtonAction()
            },
            for: .touchUpInside
        )
        return button
    }()

    init(actionHandler: ActionHandler) {
        self.actionHandler = actionHandler
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) { nil }
    
    private func setupUI() {
        backgroundColor = .black
        
        addSubview(galleryButton)
        
        NSLayoutConstraint.activate([
            galleryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            galleryButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            galleryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: WFConstant.Layout.margin),
            galleryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -WFConstant.Layout.margin),
            galleryButton.heightAnchor.constraint(equalToConstant: WFConstant.Layout.buttonHeight)
        ])
    }
}

extension GalleryView {
    struct ActionHandler {
        let galleryButtonAction: () -> Void
    }
}
