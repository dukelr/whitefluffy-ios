
//  GalleryInteractor.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol GalleryInteractorProtocol {
    func activate()
    func didTapSearchButton(text: String?)
    func didSelectPhoto(index: Int)
}

final class GalleryInteractor: GalleryInteractorProtocol {
    private var presenter: GalleryPresenterProtocol
    private let photoService: WFPhotoServiceProtocol
    private let photoStorage: WFPhotoStorageProtocol
    private let imageLoader: WFWFImageLoaderProtocol
    
    private var models: [PhotoModel]? {
        didSet {
            guard let models else { return }
            
            presenter.updatePhotos(models: models)
        }
    }

    init(
        presenter: GalleryPresenterProtocol,
        photoService: WFPhotoServiceProtocol,
        photoStorage: WFPhotoStorageProtocol,
        imageLoader: WFWFImageLoaderProtocol
    ) {
        self.presenter = presenter
        self.photoService = photoService
        self.photoStorage = photoStorage
        self.imageLoader = imageLoader
    }

    func activate() {
        sendRequestToFetchPhotos()
    }
    
    func didTapSearchButton(text: String?) {
        guard let text else { return }

        sendRequestToSearchPhoto(query: text)
    }
    
    func didSelectPhoto(index: Int) {
        guard let models else { return }
        
        presenter.showDetailPhoto(model: models[index])
    }
    
    private func loadPhotos() {
        models?.enumerated().forEach { index, model in
            if let photo = try? photoStorage.getPhoto(id: model.id) {
                models?[index] = photo
            } else {
                imageLoader.startLoading(url: model.url) { [weak self] in
                    guard let self else { return }
                    
                    models?[index].image = $0
                }
            }
        }
    }
    
    private func sendRequestToFetchPhotos() {
        presenter.showLoader(true)
        photoService.fetchPhotos { [weak self] in
            defer { self?.presenter.showLoader(false) }

            guard let self else { return }
                        
            switch $0 {
            case .success(let photos):
                models = photos
                loadPhotos()
                
            case .failure(let error):
                models = []
                handleBackendError(error)
            }
        }
    }
    
    private func sendRequestToSearchPhoto(query: String) {
        presenter.showLoader(true)
        photoService.searchPhotos(query: query) { [weak self] in
            defer { self?.presenter.showLoader(false) }

            guard let self else { return }
                        
            switch $0 {
            case .success(let photos):
                models = photos
                loadPhotos()
                
            case .failure(let error):
                models = []
                handleBackendError(error)
            }
        }
    }
    
    private func handleBackendError(_ error: WFBackend.ErrorType) {
        switch error {
        case .serverIssue:
            presenter.showAlert(
                .serverIssue,
                handler: nil
            )
        case .networkIssue:
            presenter.showAlert(
                .networkIssue,
                handler: nil
            )
        case .unknown:
            presenter.showAlert(
                .unknownError,
                handler: nil
            )
        }
    }
}
