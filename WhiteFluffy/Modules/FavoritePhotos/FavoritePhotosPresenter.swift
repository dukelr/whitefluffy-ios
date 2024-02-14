
//  FavoritePhotosPresenter.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

protocol FavoritePhotosPresenterProtocol {
    func updatePhotos(models: [PhotoModel])
    func showAlert(
        _ config: WFAlertConfig.Common,
        handler: ((UIAlertAction) -> Void)?
    )
    func showDetailPhoto(_ photo: PhotoModel)
}

struct FavoritePhotosPresenter: FavoritePhotosPresenterProtocol {
    private weak var viewController: FavoritePhotosViewControllerProtocol?
    private let router: WFRouterProtocol
    
    init(
        viewController: FavoritePhotosViewControllerProtocol,
        router: WFRouterProtocol
    ) {
        self.viewController = viewController
        self.router = router
    }
    
    func updatePhotos(models: [PhotoModel]) {
        viewController?.setupModels(models)
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
    
    func showDetailPhoto(_ photo: PhotoModel) {
        router.routeToDetailPhoto(model: photo)
    }
}
