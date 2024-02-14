
//  DetailPhotoView.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

private enum Constant {
    static let authorLabelText = "Author: "
    static let createdAtLabelText = "Created at: "
    static let locationLabelText = "Location: "
    static let emptyLocationText = "Unknown"
    static let downloadsLabelText = "Downloads: "
    static let multiplier: CGFloat = 1
    static let likeButtonSide: CGFloat = 24
}

final class DetailPhotoView: UIView {
    let actionHandler: ActionHandler
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView().prepareToAutoLayout()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView().prepareToAutoLayout()
        stackView.spacing = WFConstant.Layout.margin / 2
        stackView.axis = .vertical
        return stackView
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel().prepareToAutoLayout()
        label.numberOfLines = .zero
        return label
    }()
    
    private let createdAtLabel: UILabel = {
        let label = UILabel().prepareToAutoLayout()
        label.numberOfLines = .zero
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel().prepareToAutoLayout()
        label.numberOfLines = .zero
        return label
    }()
    
    private let downloadsLabel: UILabel = {
        let label = UILabel().prepareToAutoLayout()
        label.numberOfLines = .zero
        return label
    }()
    
    private(set) lazy var likeButton: UIButton = {
        let button = UIButton().prepareToAutoLayout()
        button.imageView?.contentMode = .scaleAspectFit
        button.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                
                actionHandler.likeButtonAction()
            },
            for: .touchUpInside
        )
        button.isHidden = true
        return button
    }()
    
    private(set) var loaderView = WFLoaderView().prepareToAutoLayout()
    
    init(actionHandler: ActionHandler) {
        self.actionHandler = actionHandler
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) { nil }
    
    private func setupUI() {
        backgroundColor = .black
        
        addSubview(photoImageView)
        addSubview(likeButton)
        addSubview(stackView)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(downloadsLabel)
        stackView.addArrangedSubview(createdAtLabel)
        addSubview(loaderView)
        
        NSLayoutConstraint.activate([
            likeButton.widthAnchor.constraint(equalToConstant: Constant.likeButtonSide),
            likeButton.heightAnchor.constraint(equalToConstant: Constant.likeButtonSide),
            
            photoImageView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: WFConstant.Layout.margin
            ),
            photoImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: WFConstant.Layout.margin
            ),
            photoImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -WFConstant.Layout.margin
            ),
            NSLayoutConstraint(
                item: photoImageView,
                attribute: .width,
                relatedBy: .equal,
                toItem: photoImageView,
                attribute: .height,
                multiplier: Constant.multiplier,
                constant: .zero
            ),
            stackView.topAnchor.constraint(
                equalTo: photoImageView.bottomAnchor,
                constant: WFConstant.Layout.margin
            ),
            stackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: WFConstant.Layout.margin
            ),
            stackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -WFConstant.Layout.margin
            ),
            loaderView.topAnchor.constraint(equalTo: topAnchor),
            loaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loaderView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setViews(model: PhotoModel) {
        photoImageView.image = model.image
        likeButton.setImage(
            model.isLiked ? WFImage.Icon.heartFill : WFImage.Icon.heart,
            for: []
        )
        likeButton.tintColor = model.isLiked ? .red : .darkGray
        likeButton.isHidden = false
        authorLabel.text = Constant.authorLabelText + model.author
        createdAtLabel.text = Constant.createdAtLabelText + model.createdAt
        downloadsLabel.text = Constant.downloadsLabelText + "\(model.downloadsCount)"
        locationLabel.text = Constant.locationLabelText + (model.location.isEmpty ? Constant.emptyLocationText : model.location)
    }
}

extension DetailPhotoView {
    struct ActionHandler {
        let likeButtonAction: () -> Void
    }
}
