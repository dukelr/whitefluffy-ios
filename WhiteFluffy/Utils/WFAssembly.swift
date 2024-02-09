//
//  WFAssembly.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

enum WFAssembly {
    static let database: WFDatabase = { WFDatabase() }()
    
    static let photoStorage: WFLocalStorage.Photo = { WFLocalStorage.Photo() }()

    static let photoLoader: WFPhotoLoader = { WFPhotoLoader() }()
    
    static let unsplashPhotoPicker: WFUnsplashPhotoPicker = { WFUnsplashPhotoPicker() }()
    
    static let window: WFWindow = { WFWindow() }()
}
