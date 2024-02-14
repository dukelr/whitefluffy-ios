//
//  PhotoBackendModel.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import Foundation

struct SearchPhotoList: Decodable {
    let results: [PhotoBackendModel]
}

struct PhotoBackendModel: Decodable {
    let id: String
    let user: User
    let urls: URLType
    let description: String?
    let location: Location?
    let downloads: Int?
    let createdAt: String
}

extension PhotoBackendModel {
    struct User: Decodable {
        let name: String
    }
    
    struct URLType: Decodable {
        let small: String
    }
    
    struct Location: Decodable {
        let city: String?
        let country: String?
    }
}
