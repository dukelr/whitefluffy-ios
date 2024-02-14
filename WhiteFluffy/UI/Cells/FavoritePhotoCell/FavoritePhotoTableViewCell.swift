//
//  FavoritePhotoTableViewCell.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

private enum Constant {
    static let photoImageViewHeight: CGFloat = 100
}

final class FavoritePhotoTableViewCell: UITableViewCell {
    private let containerView: UIView = {
        let view = UIView().prepareToAutoLayout()
        view.setRoundedBorder()
        return view
    }()
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView().prepareToAutoLayout()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel().prepareToAutoLayout()
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
            
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
        
        contentView.addSubview(containerView)
        containerView.addSubview(photoImageView)
        containerView.addSubview(authorLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: WFConstant.Layout.margin / 2
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -WFConstant.Layout.margin / 2
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -WFConstant.Layout.margin / 2
            ),
            photoImageView.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: WFConstant.Layout.margin / 2
            ),
            photoImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: WFConstant.Layout.margin / 2
            ),
            photoImageView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -WFConstant.Layout.margin / 2
            ),
            photoImageView.heightAnchor.constraint(equalToConstant: Constant.photoImageViewHeight),
            photoImageView.widthAnchor.constraint(equalToConstant: Constant.photoImageViewHeight),

            authorLabel.topAnchor.constraint(equalTo: photoImageView.topAnchor),
            authorLabel.leadingAnchor.constraint(
                equalTo: photoImageView.trailingAnchor,
                constant: WFConstant.Layout.margin / 2
            ),
            authorLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -WFConstant.Layout.margin / 2
                
            ),
            authorLabel.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor),
        ])
    }
    
    func configure(model: PhotoModel) {
        photoImageView.image = model.image
        authorLabel.text = model.author
    }
}
