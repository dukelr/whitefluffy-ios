//
//  UIAlertController+AlertConfigurable.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

protocol AlertConfigurable {
    var title: String { get }
    var message: String? { get }
    
    func actions(handler: ((UIAlertAction) -> Void)?) -> [UIAlertAction]
    func defaultAction(
        title: String,
        handler: ((UIAlertAction) -> Void)?
    ) -> UIAlertAction
    func cancelAction(handler: ((UIAlertAction) -> Void)?) -> UIAlertAction
}

extension AlertConfigurable {
    func defaultAction(
        title: String = WFConstant.ButtonTitle.ok,
        handler: ((UIAlertAction) -> Void)? = nil
    ) -> UIAlertAction {
        UIAlertAction(
            title: title,
            style: .default,
            handler: handler
        )
    }
    
    func cancelAction(handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        UIAlertAction(
            title: WFConstant.ButtonTitle.cancel,
            style: .cancel,
            handler: handler
        )
    }
}

extension UIAlertController {
    convenience init(
        config: AlertConfigurable,
        handler: ((UIAlertAction) -> Void)?
    ) {
        self.init(
            title: config.title,
            message: config.message,
            preferredStyle: .alert
        )
        config.actions(handler: handler).forEach { addAction($0) }
    }
}
