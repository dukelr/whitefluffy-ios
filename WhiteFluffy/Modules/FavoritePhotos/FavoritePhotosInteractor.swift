
//  FavoritePhotosInteractor.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol FavoritePhotosInteractorProtocol {
    func activate()
    func didChangePhotoCount()
    func didSelectPhoto(index: Int)
}

final class FavoritePhotosInteractor: FavoritePhotosInteractorProtocol {
    private let presenter: FavoritePhotosPresenterProtocol
    private let router: FavoritePhotosRouterProtocol
    private let photoStorage: WFPhotoStorageProtocol
    
    private var models: [PhotoModel]? {
        didSet {
            guard let models else { return }
            
            presenter.updatePhotos(models: models)
        }
    }
    
    init(
        presenter: FavoritePhotosPresenterProtocol,
        router: FavoritePhotosRouterProtocol,
        photoStorage: WFPhotoStorageProtocol
    ) {
        self.presenter = presenter
        self.router = router
        self.photoStorage = photoStorage
    }
    
    func activate() {
        models = try? photoStorage.getPhotos()
    }
    
    func didChangePhotoCount() {
        models = try? photoStorage.getPhotos()
    }
    
    func didSelectPhoto(index: Int) {
        guard let models else { return }
        
        router.routeToDetailPhoto(photo: models[index])
    }
}
