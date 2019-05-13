//
//  Article+CoreDataProperties.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/11/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var id: Int64
    @NSManaged public var publishedAt: Date?
    @NSManaged public var source: String?
    @NSManaged public var title: String?
    @NSManaged public var url: URL?
    @NSManaged public var numberOfViews: Int32
    @NSManaged public var abstract: String?
    @NSManaged public var media: Set<Media>

}

// MARK: Generated accessors for media
extension Article {

    @objc(addMediaObject:)
    @NSManaged public func addToMedia(_ value: Media)

    @objc(removeMediaObject:)
    @NSManaged public func removeFromMedia(_ value: Media)

    @objc(addMedia:)
    @NSManaged public func addToMedia(_ values: NSSet)

    @objc(removeMedia:)
    @NSManaged public func removeFromMedia(_ values: NSSet)

}
