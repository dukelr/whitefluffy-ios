
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
    private let router: DetailPhotoRouterProtocol
    private let photoStorage: WFPhotoStorageProtocol
    private let photoLoader: WFPhotoLoaderProtocol
    private var model: PhotoModel {
        didSet {
            presenter.updateDetailPhoto(model: model)
        }
    }

    init(
        presenter: DetailPhotoPresenterProtocol,
        router: DetailPhotoRouterProtocol,
        photoStorage: WFPhotoStorageProtocol,
        photoLoader: WFPhotoLoaderProtocol,
        model: PhotoModel
    ) {
        self.presenter = presenter
        self.router = router
        self.photoStorage = photoStorage
        self.photoLoader = photoLoader
        self.model = model
    }

    func activate() {
        presenter.showLoader(true)
        photoLoader.load(url: model.url) { [weak self] image in
            defer { self?.presenter.showLoader(false) }
            
            guard let self, let image else {
                self?.presenter.showAlert(.failedImage) { [weak self] _ in
                    guard let self else { return }
                    
                    router.close()
                }
                return
            }
            model.image = image
        }
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
}
