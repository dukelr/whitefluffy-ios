//
//  DetailPhotoTableViewCell.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

private enum Constant {
    static let authorLabelText = "Author: "
    static let createdAtLabelText = "Created at: "
    static let locationLabelText = "Location: "
    static let downloadsCountLabelText = "Downloads count: "
}

final class DetailPhotoTableViewCell: UITableViewCell {
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
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    private let createdAtLabel: UILabel = {
        let label = UILabel().prepareToAutoLayout()
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel().prepareToAutoLayout()
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    private let downloadsCountLabel: UILabel = {
        let label = UILabel().prepareToAutoLayout()
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton().prepareToAutoLayout()
        button.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                
                likeButtonAction?()
            },
            for: .touchUpInside
        )
        return button
    }()
    
    private var likeButtonAction: (() -> Void)?
        
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        setupUI()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .black
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(likeButton)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(createdAtLabel)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(downloadsCountLabel)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: WFConstant.Layout.margin),
            photoImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -WFConstant.Layout.margin
            ),
            NSLayoutConstraint(
                item: photoImageView,
                attribute: .width,
                relatedBy: .equal,
                toItem: photoImageView,
                attribute: .height,
                multiplier: 1,
                constant: .zero
            ),
            likeButton.topAnchor.constraint(equalTo: photoImageView.topAnchor),
            likeButton.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),

            stackView.topAnchor.constraint(
                equalTo: photoImageView.bottomAnchor,
                constant: WFConstant.Layout.margin
            ),
            stackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: WFConstant.Layout.margin
            ),
            stackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -WFConstant.Layout.margin
            ),
            stackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -WFConstant.Layout.margin
            ),
        ])
    }
    
    func configure(
        model: PhotoModel,
        onLike: (() -> Void)?
    ) {
        likeButtonAction = onLike
        photoImageView.image = model.image
        likeButton.tintColor = model.isLiked ? .red : .darkGray
        likeButton.setImage(
            model.isLiked ? WFImage.Icon.heartFill : WFImage.Icon.heart,
            for: []
        )
        
        if let author = model.author {
            authorLabel.text = Constant.authorLabelText + author
        }
        if let createdAt = model.createdAt {
            createdAtLabel.text = createdAt
        }
        if let location = model.location {
            locationLabel.text = Constant.locationLabelText + location
        }
        if let downloadsCount = model.downloadsCount {
            downloadsCountLabel.text = Constant.downloadsCountLabelText + "\(downloadsCount)"
        }
    }
}
