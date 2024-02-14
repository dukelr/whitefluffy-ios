
//  GalleryPresenter.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

protocol GalleryPresenterProtocol {
    func updatePhotos(models: [PhotoModel])
    func showLoader(_ shows: Bool)
    func showAlert(
        _ config: WFAlertConfig.Common,
        handler: ((UIAlertAction) -> Void)?
    )
    func showDetailPhoto(model: PhotoModel)
}

struct GalleryPresenter: GalleryPresenterProtocol {
    private weak var viewController: GalleryViewControllerProtocol?
    private let router: WFRouterProtocol

    init(
        viewController: GalleryViewControllerProtocol,
        router: WFRouterProtocol
    ) {
        self.viewController = viewController
        self.router = router
    }
    
    func updatePhotos(models: [PhotoModel]) {
        viewController?.setupModels(models)
    }
    
    func showLoader(_ shows: Bool) {
        viewController?.setupLoaderView(isAnimating: shows)
    }
    
    func showAlert(
        _ config: WFAlertConfig.Common,
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
    
    func showDetailPhoto(model: PhotoModel) {
        router.routeToDetailPhoto(model: model)
    }
}
