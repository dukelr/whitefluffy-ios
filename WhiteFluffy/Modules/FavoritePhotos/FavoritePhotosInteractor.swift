
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
    private let photoStorage: WFPhotoStorageProtocol
    
    private var models: [PhotoModel]? {
        didSet {
            guard let models else { return }
            
            presenter.updatePhotos(models: models)
        }
    }
    
    init(
        presenter: FavoritePhotosPresenterProtocol,
        photoStorage: WFPhotoStorageProtocol
    ) {
        self.presenter = presenter
        self.photoStorage = photoStorage
    }
    
    func activate() {
        getPhotos()
    }
    
    func didChangePhotoCount() {
        getPhotos()
    }
    
    func getPhotos() {
        do {
            models = try photoStorage.getPhotos()
        } catch {
            presenter.showAlert(
                .unknownError,
                handler: nil
            )
        }
    }
    
    func didSelectPhoto(index: Int) {
        guard let models else { return }
        
        presenter.showDetailPhoto(models[index])
    }
}
