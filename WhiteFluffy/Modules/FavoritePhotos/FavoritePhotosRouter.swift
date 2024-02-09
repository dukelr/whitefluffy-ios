
//  FavoritePhotosRouter.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol FavoritePhotosRouterProtocol {
    func routeToDetailPhoto(photo: PhotoModel)
}

struct FavoritePhotosRouter: FavoritePhotosRouterProtocol {
    private weak var viewController: FavoritePhotosViewControllerProtocol?

    init(viewController: FavoritePhotosViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func routeToDetailPhoto(photo: PhotoModel) {
        viewController?.navigationController?.pushViewController(
            DetailPhotoAssembly().assemble(photo: photo),
            animated: true
        )
    }
}
