
//  DetailPhotoRouter.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol DetailPhotoRouterProtocol {
    func close()
}

struct DetailPhotoRouter: DetailPhotoRouterProtocol {
    private weak var viewController: DetailPhotoViewControllerProtocol?

    init(viewController: DetailPhotoViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func close() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
}
