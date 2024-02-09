
//  GalleryPresenter.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol GalleryPresenterProtocol {}

struct GalleryPresenter: GalleryPresenterProtocol {
    private weak var viewController: GalleryViewControllerProtocol?

    init(viewController: GalleryViewControllerProtocol) {
        self.viewController = viewController
    }
}
