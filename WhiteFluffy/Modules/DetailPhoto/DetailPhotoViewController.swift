
//  DetailPhotoViewController.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

protocol DetailPhotoViewControllerProtocol: UIViewController {
    func setupModel(_ model: PhotoModel)
    func setupLoaderView(isAnimating: Bool)
}

private enum Constant {
    static let title = "Detail Photo"
}

final class DetailPhotoViewController: UIViewController {
    // MARK: - Dependencies

    var interactor: DetailPhotoInteractorProtocol!
    
    // MARK: - Properties

    private lazy var contentView = DetailPhotoView(actionHandler: setupActionHandler())
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
        title = Constant.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: contentView.likeButton)

        notificationCenter.addObserver(
            forName: .didChangePhotoCount,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            guard let self else { return }
            
            interactor.didChangePhotoCount()
        }
    }
    
    private func setupActionHandler() -> DetailPhotoView.ActionHandler {
        DetailPhotoView.ActionHandler(
            likeButtonAction: { [weak self] in
                guard let self else { return }
                
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                interactor.didTapLikeButton()
            }
        )
    }
}

// MARK: - DetailPhotoViewControllerProtocol

extension DetailPhotoViewController: DetailPhotoViewControllerProtocol {
    func setupModel(_ model: PhotoModel) {
        contentView.setViews(model: model)
    }
    
    func setupLoaderView(isAnimating: Bool) {
        if isAnimating {
            contentView.loaderView.startLoading()
        } else {
            contentView.loaderView.stopLoading()
        }
    }
}
