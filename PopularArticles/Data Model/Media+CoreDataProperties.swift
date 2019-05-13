//
//  Media+CoreDataProperties.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/13/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//
//

import Foundation
import CoreData


extension Media {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Media> {
        return NSFetchRequest<Media>(entityName: "Media")
    }

    @NSManaged public var caption: String?
    @NSManaged public var copyright: String?
    @NSManaged public var type: String?
    @NSManaged public var article: Article?
    @NSManaged public var metadata: Set<MediaMetadata>

}

// MARK: Generated accessors for metadata
extension Media {

    @objc(addMetadataObject:)
    @NSManaged public func addToMetadata(_ value: MediaMetadata)

    @objc(removeMetadataObject:)
    @NSManaged public func removeFromMetadata(_ value: MediaMetadata)

    @objc(addMetadata:)
    @NSManaged public func addToMetadata(_ values: NSSet)

    @objc(removeMetadata:)
    @NSManaged public func removeFromMetadata(_ values: NSSet)

}
