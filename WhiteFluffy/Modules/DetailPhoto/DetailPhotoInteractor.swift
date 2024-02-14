
//  DetailPhotoInteractor.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol DetailPhotoInteractorProtocol {
    func activate()
    func didChangePhotoCount()
    func didTapLikeButton()
}

final class DetailPhotoInteractor: DetailPhotoInteractorProtocol {
    private let presenter: DetailPhotoPresenterProtocol
    private let photoStorage: WFPhotoStorageProtocol
    private let imageLoader: WFWFImageLoaderProtocol
    private var model: PhotoModel {
        didSet {
            presenter.updateDetailPhoto(model: model)
        }
    }

    init(
        presenter: DetailPhotoPresenterProtocol,
        photoStorage: WFPhotoStorageProtocol,
        imageLoader: WFWFImageLoaderProtocol,
        model: PhotoModel
    ) {
        self.presenter = presenter
        self.photoStorage = photoStorage
        self.imageLoader = imageLoader
        self.model = model
    }

    func activate() {
        guard let photo = try? photoStorage.getPhoto(id: model.id) else {
            validatePhotoImage()
            return
        }
        model = photo
    }
    
    func didChangePhotoCount() {
        guard let photo = try? photoStorage.getPhoto(id: model.id) else {
            model.isLiked = false
            return
        }
        model = photo
    }
    
    func didTapLikeButton() {
        model.isLiked.toggle()
        
        if model.isLiked {
            photoStorage.savePhoto(model)
        } else {
            photoStorage.deletePhoto(model.id)
        }
    }
    
    private func validatePhotoImage() {
        guard model.image != nil else {
            loadImage()
            return
        }
        presenter.updateDetailPhoto(model: model)
    }
    
    private func loadImage() {
        presenter.showLoader(true)
        imageLoader.startLoading(url: model.url) { [weak self] image in
            defer { self?.presenter.showLoader(false) }
            
            guard let self, let image else {
                self?.presenter.showAlert(.failedImage) { [weak self] _ in
                    guard let self else { return }
                    
                    presenter.showGallery()
                }
                return
            }
            model.image = image
        }
    }
}
