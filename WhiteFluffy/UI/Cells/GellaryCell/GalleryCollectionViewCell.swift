//
//  GalleryCollectionViewCell.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import UIKit

final class GalleryCollectionViewCell: UICollectionViewCell {
    private let photoImageView = UIImageView().prepareToAutoLayout()
    
    private let loaderView = WFLoaderView(style: .medium).prepareToAutoLayout()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) { nil }
    
    private func setupUI() {
        backgroundColor = .black
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(loaderView)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            loaderView.topAnchor.constraint(equalTo: photoImageView.topAnchor),
            loaderView.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
            loaderView.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            loaderView.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor)
        ])
    }
    
    func configure(model: PhotoModel) {
        if let image = model.image {
            photoImageView.image = image
            loaderView.stopLoading()
        } else {
            loaderView.startLoading()
        }
    }
}
