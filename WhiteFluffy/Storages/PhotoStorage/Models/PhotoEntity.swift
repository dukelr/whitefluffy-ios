//
//  PhotoEntity.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import Foundation
import CoreData

@objc(PhotoEntity)
public class PhotoEntity: NSManagedObject {
    @NSManaged
    public var id: String
    @NSManaged
    public var url: URL?
    @NSManaged
    public var imageData: Data?
    @NSManaged
    public var createdAt: String?
    @NSManaged
    public var location: String?
    @NSManaged
    public var author: String?
    @NSManaged
    public var downloadsCount: String?
    @NSManaged
    public var isLiked: Bool


}

extension PhotoEntity: Identifiable {}

extension PhotoEntity {
    enum Property: CaseIterable {
        case id
        case url
        case imageData
        case createdAt
        case location
        case author
        case downloadsCount
        case isLiked
    }
}
