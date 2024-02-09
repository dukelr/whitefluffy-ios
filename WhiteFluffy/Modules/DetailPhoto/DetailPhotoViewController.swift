
//  DetailPhotoViewController.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

protocol DetailPhotoViewControllerProtocol: UIViewController {
    func setupModel(_ model: PhotoModel)
    func setupActivityIndicatorView(isAnimating: Bool)
}

private enum Constant {
    static let title = "Detail Photo"
}

final class DetailPhotoViewController: UIViewController {
    // MARK: - Dependencies

    var interactor: DetailPhotoInteractorProtocol!
    
    // MARK: - Properties

    private let contentView = DetailPhotoView()
    private var model: PhotoModel? {
        didSet {
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
        
        title = Constant.title
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

// MARK: - DetailPhotoViewControllerProtocol

extension DetailPhotoViewController: DetailPhotoViewControllerProtocol {
    func setupModel(_ model: PhotoModel) {
        self.model = model
    }
    
    func setupActivityIndicatorView(isAnimating: Bool) {
        if isAnimating {
            contentView.activityIndicatorView.startAnimating()
        } else {
            contentView.activityIndicatorView.stopAnimating()
        }
    }
}

// MARK: - UITableViewDelegate

extension DetailPhotoViewController: UITableViewDelegate {}

// MARK: - DetailPhotoViewControllerProtocol

extension DetailPhotoViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let model, let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailPhotoTableViewCell.identifier,
            for: indexPath
        ) as? DetailPhotoTableViewCell else { return UITableViewCell() }
        
        cell.configure(model: model) { [weak self] in
            guard let self else { return }
            
            interactor.didTapLikeButton()
        }
        return cell
    }
}
