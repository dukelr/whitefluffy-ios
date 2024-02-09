
//  FavoritePhotosViewController.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//


import UIKit

protocol FavoritePhotosViewControllerProtocol: UIViewController {
    func setupModels(_ models: [PhotoModel])
}

final class FavoritePhotosViewController: UIViewController {
    // MARK: - Dependencies

    var interactor: FavoritePhotosInteractorProtocol!

    // MARK: - Properties

    private lazy var contentView = FavoritePhotosView()
    private var models: [PhotoModel]? {
        didSet {
            guard let models else { return }
            
            contentView.emptyPlaceholderLabel.isHidden = !models.isEmpty
            contentView.tableView.reloadData()
        }
    }
    private let notificationCenter = NotificationCenter.default
    
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
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        
        notificationCenter.addObserver(
            forName: .didChangePhotoCount,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            guard let self else { return }
            
            interactor.didChangePhotoCount()
        }
    }
}

// MARK: - FavoritePhotosViewControllerProtocol

extension FavoritePhotosViewController: FavoritePhotosViewControllerProtocol {
    func setupModels(_ models: [PhotoModel]) {
        self.models = models
    }
}

// MARK: - UITableViewDelegate

extension FavoritePhotosViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        interactor.didSelectPhoto(index: indexPath.row)
    }
}

// MARK: - DetailPhotoViewControllerProtocol

extension FavoritePhotosViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        models?.count ?? .zero
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let models, let cell = tableView.dequeueReusableCell(
            withIdentifier: FavoritePhotoTableViewCell.identifier,
            for: indexPath
        ) as? FavoritePhotoTableViewCell else { return UITableViewCell() }
        
        cell.configure(model: models[indexPath.row])
        return cell
    }
}

