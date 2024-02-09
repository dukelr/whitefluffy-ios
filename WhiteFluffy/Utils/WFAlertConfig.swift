//
//  WFAlertConfig.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

enum WFAlertConfig {}

extension WFAlertConfig {
    enum Common: AlertConfigurable {
        case unknownError
        case networkIssue
                
        var title: String {
            switch self {
            case .unknownError,.networkIssue: "Ошибка"
            }
        }
        
        var message: String? {
            switch self {
            case .unknownError: "Произошла неизвестная ошибка"
            case .networkIssue: "Отсутствует подключение к сети интернет"
            }
        }
        
        func actions(handler: ((UIAlertAction) -> Void)?) -> [UIAlertAction] {
            switch self {
            case .unknownError, .networkIssue: [defaultAction(handler: handler)]
            }
        }
    }
}

extension WFAlertConfig {
    enum DetailPhoto: AlertConfigurable {
        case common(config: WFAlertConfig.Common)
        case failedImage
                
        var title: String {
            switch self {
            case .common(let config): config.title
            case .failedImage: "Ошибка"
            }
        }
        
        var message: String? {
            switch self {
            case .common(let config): config.message
            case .failedImage: "Неудалось загрузить фото"
            }
        }
        
        func actions(handler: ((UIAlertAction) -> Void)?) -> [UIAlertAction] {
            switch self {
            case .common(let config): config.actions(handler: handler)
            case .failedImage: [defaultAction(handler: handler)]
            }
        }
    }
}
