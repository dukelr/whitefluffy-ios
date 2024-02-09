
//  GalleryRouter.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

protocol GalleryRouterProtocol {
    func routeToDetailPhoto(photo: PhotoModel)
    func routeToUnspashPhotos()
}

struct GalleryRouter: GalleryRouterProtocol {
    private weak var viewController: GalleryViewControllerProtocol?
    private let unsplashPhotoPicker: WFUnsplashPhotoPickerProtocol

    init(
        viewController: GalleryViewControllerProtocol,
        unsplashPhotoPicker: WFUnsplashPhotoPickerProtocol
    ) {
        self.viewController = viewController
        self.unsplashPhotoPicker = unsplashPhotoPicker
    }
    
    func routeToUnspashPhotos() {
        viewController?.present(
            unsplashPhotoPicker.configure(viewController: viewController),
            animated: true
        )
    }
    
    func routeToDetailPhoto(photo: PhotoModel) {
        viewController?.dismiss(animated: true) {
            viewController?.navigationController?.pushViewController(
                DetailPhotoAssembly().assemble(photo: photo),
                animated: true
            )
        }
    }
}
