
//  DetailPhotoPresenter.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

protocol DetailPhotoPresenterProtocol {
    func updateDetailPhoto(model: PhotoModel)
    func showLoader(_ shows: Bool)
    func showAlert(
        _ config: WFAlertConfig.DetailPhoto,
        handler: ((UIAlertAction) -> Void)?
    )
    func showGallery()
}

struct DetailPhotoPresenter: DetailPhotoPresenterProtocol {
    private weak var viewController: DetailPhotoViewControllerProtocol?
    private let router: WFRouterProtocol

    init(
        viewController: DetailPhotoViewControllerProtocol,
        router: WFRouterProtocol
    ) {
        self.viewController = viewController
        self.router = router
    }
    
    func updateDetailPhoto(model: PhotoModel) {
        viewController?.setupModel(model)
    }
    
    func showLoader(_ shows: Bool) {
        viewController?.setupLoaderView(isAnimating: shows)
    }
    
    func showAlert(
        _ config: WFAlertConfig.DetailPhoto,
        handler: ((UIAlertAction) -> Void)?
    ) {
        viewController?.present(
            UIAlertController(
                config: config,
                handler: handler
            ),
            animated: true
        )
    }
    
    func showGallery() {
        router.close()
    }
}
