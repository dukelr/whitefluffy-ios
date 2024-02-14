//
//  WFAssembly.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

enum WFAssembly {
    static let database: WFDatabase = { WFDatabase() }()
    
    static let dateFormatter: WFDateFormatter = { WFDateFormatter() }()
    
    static let backendErrorHandler: WFBackend.ErrorHandler = { WFBackend.ErrorHandler(networkMonitor: networkMonitor) }()
    
    static let imageLoader: WFImageLoader = { WFImageLoader() }()
    
    static let photoService: WFBackend.Service.Photo = { WFBackend.Service.Photo() }()
    
    static let photoStorage: WFLocalStorage.Photo = { WFLocalStorage.Photo() }()
        
    static let mapper: WFMapper = { WFMapper(dateFormatter: dateFormatter) }()
    
    static let networkMonitor: WFNetworkMonitor = { WFNetworkMonitor() }()
        
    static let window: WFWindow = { WFWindow() }()
    
    static func router(viewController: UIViewController) -> WFRouter {
        WFRouter(viewController: viewController)
    }

}
