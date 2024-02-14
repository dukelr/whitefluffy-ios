//
//  PhotoModel.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

struct PhotoModel {
    let id: String
    let urlString: String
    var url: URL? { URL(string: urlString) }
    let author: String
    let location: String
    let downloadsCount: Int
    let createdAt: String
    var image: UIImage?
    var isLiked = false
}
