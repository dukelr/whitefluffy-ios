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
        case serverIssue
                
        var title: String {
            switch self {
            case .unknownError,.networkIssue, .serverIssue: "Error"
            }
        }
        
        var message: String? {
            switch self {
            case .unknownError: "An unknown error occurred"
            case .networkIssue: "An internet error occurred. Please check your network connection"
            case .serverIssue: "A server error occurred"
            }
        }
        
        func actions(handler: ((UIAlertAction) -> Void)?) -> [UIAlertAction] {
            switch self {
            case .unknownError, .networkIssue, .serverIssue: [defaultAction(handler: handler)]
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
            case .failedImage: "Error"
            }
        }
        
        var message: String? {
            switch self {
            case .common(let config): config.message
            case .failedImage: "Failed to load image"
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
