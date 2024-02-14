//
//  PhotoStorage.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit
import CoreStore

protocol WFPhotoStorageProtocol {
    func savePhoto(_ photo: PhotoModel)
    func getPhoto(id: String) throws -> PhotoModel?
    func getPhotos() throws -> [PhotoModel]
    func deletePhoto(_ id: String)
}

extension WFLocalStorage {
    final class Photo: WFPhotoStorageProtocol {
        private let notificationCenter = NotificationCenter.default
        
        // MARK: Save

        func savePhoto(_ photo: PhotoModel) {
            dataStack.perform(
                asynchronous: {
                    let entity = $0.create(Into<PhotoEntity>())
                    
                    PhotoEntity.Property.allCases.forEach {
                        switch $0 {
                        case .id: entity.id = photo.id
                        case .urlString: entity.urlString = photo.urlString
                        case .imageData: entity.imageData = photo.image?.pngData()
                        case .createdAt: entity.createdAt = photo.createdAt
                        case .location: entity.location = photo.location
                        case .author: entity.author = photo.author
                        case .isLiked: entity.isLiked = photo.isLiked
                        case .downloadsCount: entity.downloadsCount = "\(String(describing: photo.downloadsCount))"
                        }
                    }
                },
                success: { [weak self] in
                    guard let self else { return }
                    
                    print("[WFLocalStorage] Success save photo")
                    
                    notificationCenter.post(
                        name: .didChangePhotoCount,
                        object: nil
                    )
                },
                failure: { print("[WFLocalStorage] Failed to save photo: \($0.localizedDescription)") }
            )
        }
        
        // MARK: Get
        
        func getPhotos() throws -> [PhotoModel] {
            do {
                return try dataStack.fetchAll(From<PhotoEntity>()).compactMap {
                    guard let imageData = $0.imageData else { return nil }
                    
                    return  PhotoModel(
                        id: $0.id,
                        urlString: $0.urlString,
                        author: $0.author,
                        location: $0.location,
                        downloadsCount: Int($0.downloadsCount) ?? .zero,
                        createdAt: $0.createdAt,
                        image: UIImage(data: imageData),
                        isLiked: $0.isLiked
                    )
                }
            } catch {
                print("[WFLocalStorage] Failed to get photos: \(error.localizedDescription)")
                throw error
            }
        }
        
        func getPhoto(id: String) throws -> PhotoModel? {
            do {
                guard let entity = try dataStack.fetchOne(
                    From<PhotoEntity>()
                        .where(\.id == id)
                ), let imageData = entity.imageData else { return nil }
                
                return PhotoModel(
                    id: entity.id,
                    urlString: entity.urlString,
                    author: entity.author, 
                    location: entity.location,
                    downloadsCount: Int(entity.downloadsCount) ?? .zero,
                    createdAt: entity.createdAt,
                    image: UIImage(data: imageData),
                    isLiked: entity.isLiked
                )
            } catch {
                print("[WFLocalStorage] Failed to get photos: \(error.localizedDescription)")
                throw error
            }
        }
        
        // MARK: Delete
        
        func deletePhoto(_ id: String) {
            dataStack.perform(
                asynchronous: {
                    try $0.deleteAll(
                        From<PhotoEntity>()
                            .where(\.id == id)
                    )
                },
                success: { [weak self] in
                    guard let self else { return }
                    
                    print("[WFLocalStorage] Success delete photo")
                    notificationCenter.post(
                        name: .didChangePhotoCount,
                        object: nil
                    )
                },
                failure: {
                    print("[WFLocalStorage] Failed to detete photo: \($0.localizedDescription)")
                }
            )
        }
    }
}
