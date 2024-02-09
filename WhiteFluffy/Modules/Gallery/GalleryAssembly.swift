
//  GalleryAssembly.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol GalleryAssemblyProtocol {
    func assemble() -> GalleryViewControllerProtocol
}

struct GalleryAssembly: GalleryAssemblyProtocol {
    func assemble() -> GalleryViewControllerProtocol {
        let viewController = GalleryViewController()
        viewController.interactor = GalleryInteractor(
            presenter: GalleryPresenter(viewController: viewController),
            router: GalleryRouter(
                viewController: viewController,
                unsplashPhotoPicker: WFAssembly.unsplashPhotoPicker
            )
        )
        return viewController
    }
}
