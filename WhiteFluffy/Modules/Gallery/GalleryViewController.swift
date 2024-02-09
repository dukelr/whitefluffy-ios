
//  GalleryViewController.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit
import UnsplashPhotoPicker

protocol GalleryViewControllerProtocol: UIViewController {}

final class GalleryViewController: UIViewController {
    // MARK: - Dependencies

    var interactor: GalleryInteractorProtocol!
    
    // MARK: - Properties

    private lazy var contentView = GalleryView(actionHandler: setupActionHandler())
    
    // MARK: - Lifecycle funcs

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.activate()
    }

    // MARK: - Setup funcs

    private func setupUI() {}
    
    private func setupActionHandler() -> GalleryView.ActionHandler {
        GalleryView.ActionHandler(
            galleryButtonAction: { [weak self] in
                guard let self else { return }
                
                interactor.didTapGalleryButton()
            }
        )
    }
}

// MARK: - GalleryViewControllerProtocol

extension GalleryViewController: GalleryViewControllerProtocol {}

// MARK: - UnsplashPhotoPickerDelegate

extension GalleryViewController: UnsplashPhotoPickerDelegate {
    func unsplashPhotoPicker(
        _ photoPicker: UnsplashPhotoPicker,
        didSelectPhotos photos: [UnsplashPhoto]
    ) {
        guard let photo = photos.first else { return }
        
        interactor.didSelectPhoto(photo)
    }
    
    func unsplashPhotoPickerDidCancel(
        _ photoPicker: UnsplashPhotoPicker
    ) {
        
    }
}
