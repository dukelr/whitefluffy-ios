//
//  WFRouter.swift
//  WhiteFluffy
//
//  Created by duke on 2/14/24.
//

import UIKit

protocol WFRouterProtocol {
    func routeToDetailPhoto(model: PhotoModel)
    func close()
}

struct WFRouter: WFRouterProtocol {
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToDetailPhoto(model: PhotoModel) {
        viewController?.navigationController?.pushViewController(
            DetailPhotoAssembly().assemble(photo: model),
            animated: true
        )
    }
    
    func close() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
}
