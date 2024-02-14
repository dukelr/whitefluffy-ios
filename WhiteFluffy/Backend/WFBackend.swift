//
//  WFBackend.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import Foundation
import Alamofire

enum WFBackend {
    static private let baseURL = "https://api.unsplash.com/"
        
    static private let accessKey = "7-2SM9KGN2sIJuwX5v2_JLmtcnbkXGdJB8I8h2O9GcU"
        
    static func url(endpoint: Endpoint) -> String {
        baseURL + endpoint.path
    }
}

extension WFBackend {
    enum Endpoint {
        case photos(isCollection: Bool = true)
        case serach(query: String)
        
        var path: String {
            switch self {
            case .photos(let isCollection):
                "photos/random/?client_id=\(accessKey)" + (isCollection ? "&count=30" : "") + "&orientation=squarish"
                
            case .serach(let query):
                "search/photos?query=\(query)&per_page=30&orientation=squarish&client_id=\(accessKey)"
            }
        }
    }
}

extension WFBackend {
    enum ErrorType: Error {
        case serverIssue
        case networkIssue
        case unknown
    }
}

extension WFBackend {
    enum Service {
        static var errorHandler: ErrorHandler { WFAssembly.backendErrorHandler }
        static var mapper: WFMapperProtocol { WFAssembly.mapper }
        static var decoder: JSONDecoder {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }
        static var headers: HTTPHeaders { [HeaderKey.acceptVersion: "v1"] }
    }
}


extension WFBackend.Service {
    enum HeaderKey {
        static let acceptVersion = "Accept-Version"
    }
}
