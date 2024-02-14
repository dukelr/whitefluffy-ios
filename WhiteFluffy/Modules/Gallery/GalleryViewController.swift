
//  GalleryViewController.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

protocol GalleryViewControllerProtocol: UIViewController {
    func setupModels(_ models: [PhotoModel])
    func setupLoaderView(isAnimating: Bool)
}

final class GalleryViewController: UIViewController {
    // MARK: - Dependencies

    var interactor: GalleryInteractorProtocol!
    
    // MARK: - Properties

    private let contentView = GalleryView()
    private var models: [PhotoModel]? {
        didSet {
            contentView.emptyPlaceholderLabel.isHidden = !(models?.isEmpty == true)
            contentView.collectionView.reloadData()
        }
    }
    
    // MARK: - Lifecycle funcs

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.activate()
    }

    // MARK: - Setup funcs

    private func setupUI() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
}

// MARK: - GalleryViewControllerProtocol

extension GalleryViewController: GalleryViewControllerProtocol {
    func setupModels(_ models: [PhotoModel]) {
        self.models = models
    }
    
    func setupLoaderView(isAnimating: Bool) {
        if isAnimating {
            contentView.loaderView.startLoading()
        } else {
            contentView.loaderView.stopLoading()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        models?.count ?? .zero
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let models, let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GalleryCollectionViewCell.identifier,
            for: indexPath
        ) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(model: models[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        interactor.didSelectPhoto(index: indexPath.item)
    }
}

// MARK: - UICollectionViewDelegate

extension GalleryViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        interactor.didTapSearchButton(text: searchBar.text)
    }
}
