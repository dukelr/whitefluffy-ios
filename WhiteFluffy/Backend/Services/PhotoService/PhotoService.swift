//
//  PhotoService.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import Foundation
import Alamofire

protocol WFPhotoServiceProtocol {
    func fetchPhotos(completion: ((Result<[PhotoModel], WFBackend.ErrorType>) -> Void)?)
    func searchPhotos(
        query: String,
        completion: ((Result<[PhotoModel], WFBackend.ErrorType>) -> Void)?
    )
}

extension WFBackend.Service {
    final class Photo: WFPhotoServiceProtocol {
        func fetchPhotos(completion: ((Result<[PhotoModel], WFBackend.ErrorType>) -> Void)?) {
            AF.request(
                WFBackend.url(endpoint: .photos()),
                method: .get
            )
            .validate()
            .responseDecodable(
                of: [PhotoBackendModel].self,
                decoder: decoder
            ) {
                switch $0.result {
                case .success(let value): completion?(.success(mapper.mapPhotoModels(from: value)))
                case .failure:
                    errorHandler.handle(
                        response: $0,
                        completion: { completion?(.failure($0)) }
                    )
                }
            }
        }
        
        func searchPhotos(
            query: String,
            completion: ((Result<[PhotoModel], WFBackend.ErrorType>) -> Void)?
        ) {
            AF.request(
                WFBackend.url(endpoint: .serach(query: query)),
                method: .get
            )
            .validate()
            .responseDecodable(
                of: SearchPhotoList.self,
                decoder: decoder
            ) {
                switch $0.result {
                case .success(let value): completion?(.success(mapper.mapPhotoModels(from: value.results)))
                case .failure:
                    errorHandler.handle(
                        response: $0,
                        completion: { completion?(.failure($0)) }
                    )
                }
            }
        }
    }
}
