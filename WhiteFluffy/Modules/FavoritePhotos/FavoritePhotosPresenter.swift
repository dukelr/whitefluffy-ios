
//  FavoritePhotosPresenter.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol FavoritePhotosPresenterProtocol {
    func updatePhotos(models: [PhotoModel])
}

struct FavoritePhotosPresenter: FavoritePhotosPresenterProtocol {
    private weak var viewController: FavoritePhotosViewControllerProtocol?

    init(viewController: FavoritePhotosViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func updatePhotos(models: [PhotoModel]) {
        viewController?.setupModels(models)
    }
}
