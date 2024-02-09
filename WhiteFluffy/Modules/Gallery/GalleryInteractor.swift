
//  GalleryInteractor.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UnsplashPhotoPicker

protocol GalleryInteractorProtocol {
    func activate()
    func didTapGalleryButton()
    func didSelectPhoto(_ photo: UnsplashPhoto)
}

final class GalleryInteractor: GalleryInteractorProtocol {
    private var presenter: GalleryPresenterProtocol
    private var router: GalleryRouterProtocol

    init(
        presenter: GalleryPresenterProtocol,
        router: GalleryRouterProtocol
    ) {
        self.presenter = presenter
        self.router = router
    }

    func activate() {}
    
    func didTapGalleryButton() {
        router.routeToUnspashPhotos()
    }
    
    func didSelectPhoto(_ photo: UnsplashPhoto) {
        router.routeToDetailPhoto(
            photo: PhotoModel(
                id: photo.identifier,
                url: photo.urls[.regular],
                author: photo.user.name,
                location: photo.user.location,
                downloadsCount: photo.downloadsCount,
                createdAt: photo.exif?.exposureTime,
                image: nil,
                isLiked: false
            )
        )
    }
}
