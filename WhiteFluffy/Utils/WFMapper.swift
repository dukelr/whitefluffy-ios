//
//  WFMapper.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import Foundation

protocol WFMapperProtocol {
    func mapPhotoModels(from backendModels: [PhotoBackendModel]) -> [PhotoModel]
}

final class WFMapper: WFMapperProtocol {
    private let dateFormatter: WFDateFormatterProtocol
    
    init(dateFormatter: WFDateFormatterProtocol) {
        self.dateFormatter = dateFormatter
    }
    
    func mapPhotoModels(from backendModels: [PhotoBackendModel]) -> [PhotoModel] {
        backendModels.compactMap {
            guard let date = dateFormatter.iso8601.date(from: $0.createdAt) else { return nil }
            
            return PhotoModel(
                id: $0.id,
                urlString: $0.urls.small,
                author: $0.user.name,
                location: mapPhotoModelLocation(location: $0.location),
                downloadsCount: $0.downloads ?? .zero,
                createdAt: dateFormatter.format(
                    date,
                    dateFormat: .timeAndDate,
                    timeZone: .current
                )
            )
        }
    }
    
    private func mapPhotoModelLocation(location: PhotoBackendModel.Location?) -> String {
        let location = [location?.city, location?.country]
            .compactMap { $0 }
            .joined(separator: " ")
        
        return location.trimmingCharacters(in: .whitespaces).isEmpty ? "" : location
    }
}
