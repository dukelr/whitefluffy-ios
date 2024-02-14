
//  GalleryView.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

private enum Constant {
    static let emptyPlaceholderLabelText = "No photo available"
}

final class GalleryView: UIView {
    private(set) var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.itemSize = CGSize(
            width: UIScreen.main.bounds.width / 2,
            height: UIScreen.main.bounds.width / 2
        )
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        ).prepareToAutoLayout()
        collectionView.register(GalleryCollectionViewCell.self)
        return collectionView
    }()
    
    private(set) var emptyPlaceholderLabel = WFEmptyPlaceholderLabel(text: Constant.emptyPlaceholderLabelText).prepareToAutoLayout()
    
    private(set) var loaderView = WFLoaderView().prepareToAutoLayout()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) { nil }
    
    private func setupUI() {
        backgroundColor = .black
        
        addSubview(collectionView)
        addSubview(emptyPlaceholderLabel)
        addSubview(loaderView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            emptyPlaceholderLabel.topAnchor.constraint(equalTo: topAnchor),
            emptyPlaceholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyPlaceholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyPlaceholderLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            loaderView.topAnchor.constraint(equalTo: topAnchor),
            loaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loaderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
