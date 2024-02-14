
//  DetailPhotoAssembly.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol DetailPhotoAssemblyProtocol {
    func assemble(photo: PhotoModel) -> DetailPhotoViewControllerProtocol
}

struct DetailPhotoAssembly: DetailPhotoAssemblyProtocol {
    func assemble(photo: PhotoModel) -> DetailPhotoViewControllerProtocol {
        let viewController = DetailPhotoViewController()
        viewController.interactor = DetailPhotoInteractor(
            presenter: DetailPhotoPresenter(
                viewController: viewController,
                router: WFAssembly.router(viewController: viewController)
            ),
            photoStorage: WFAssembly.photoStorage,
            imageLoader: WFAssembly.imageLoader,
            model: photo
        )
        return viewController
    }
}
