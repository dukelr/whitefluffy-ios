//
//  WFImage.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

enum WFImage {}

extension WFImage {
    enum Icon {
        static let heart = UIImage(systemName: "heart")
        static let heartFill = UIImage(systemName: "heart.fill")
    }
}

extension WFImage {
    enum TabBar {
        static let gallery = UIImage(systemName: "photo.on.rectangle.angled")
        static let favoritePhotos = UIImage(systemName: "heart.rectangle")
    }
}
