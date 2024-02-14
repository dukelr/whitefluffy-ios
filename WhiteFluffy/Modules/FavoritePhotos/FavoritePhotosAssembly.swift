
//  FavoritePhotosAssembly.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol FavoritePhotosAssemblyProtocol {
    func assemble() -> FavoritePhotosViewControllerProtocol
}

struct FavoritePhotosAssembly: FavoritePhotosAssemblyProtocol {
    func assemble() -> FavoritePhotosViewControllerProtocol {
        let viewController = FavoritePhotosViewController()
        viewController.interactor = FavoritePhotosInteractor(
            presenter: FavoritePhotosPresenter(
                viewController: viewController,
                router: WFAssembly.router(viewController: viewController)
            ),
            photoStorage: WFAssembly.photoStorage
        )
        return viewController
    }
}
