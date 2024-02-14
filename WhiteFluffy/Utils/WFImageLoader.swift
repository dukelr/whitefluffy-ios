//
//  WFImageLoader.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit
import Kingfisher

protocol WFWFImageLoaderProtocol {
    func startLoading(
        url: URL?,
        completion: ((UIImage?) -> Void)?
    )
}

final class WFImageLoader: WFWFImageLoaderProtocol {
    private let kingfisher = KingfisherManager.shared
    
    func startLoading(
        url: URL?,
        completion: ((UIImage?) -> Void)?
    ) {
        guard let url else {
            completion?(nil)
            return
        }
        kingfisher.retrieveImage(with: url) {
            switch $0 {
            case .success(let value):
                guard let data = value.data() else { return }
                
                completion?(UIImage(data: data))
                
            case .failure(let error):
                print("[WFImageLoader] Failed to load photo: \(error.localizedDescription))")
                completion?(nil)
            }
        }
    }
}
