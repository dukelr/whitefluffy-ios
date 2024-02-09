//
//  TabBarItem.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case gallery
    case favoritePhotos
    
    var title: String {
        switch self {
        case .gallery: "Gallery"
        case .favoritePhotos: "Favorite Photos"
        }
    }
    var image: UIImage? {
        switch self {
        case .gallery: WFImage.TabBar.gallery
        case .favoritePhotos: WFImage.TabBar.favoritePhotos
        }
    }
}
