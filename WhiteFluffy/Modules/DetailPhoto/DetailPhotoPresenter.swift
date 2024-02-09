
//  DetailPhotoPresenter.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

protocol DetailPhotoPresenterProtocol {
    func updateDetailPhoto(model: PhotoModel)
    func showLoader(_ shows: Bool)
    func showAlert(
        _ config: WFAlertConfig.DetailPhoto,
        handler: ((UIAlertAction) -> Void)?
    )
}

struct DetailPhotoPresenter: DetailPhotoPresenterProtocol {
    private weak var viewController: DetailPhotoViewControllerProtocol?

    init(viewController: DetailPhotoViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func updateDetailPhoto(model: PhotoModel) {
        viewController?.setupModel(model)
    }
    
    func showLoader(_ shows: Bool) {
        viewController?.setupActivityIndicatorView(isAnimating: shows)
    }
    
    func showAlert(
        _ config: WFAlertConfig.DetailPhoto,
        handler: ((UIAlertAction) -> Void)?
    ) {
        
    }
}
