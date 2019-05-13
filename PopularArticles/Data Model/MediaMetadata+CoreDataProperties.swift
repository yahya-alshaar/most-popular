//
//  MediaMetadata+CoreDataProperties.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/13/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//
//

import Foundation
import CoreData


extension MediaMetadata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MediaMetadata> {
        return NSFetchRequest<MediaMetadata>(entityName: "MediaMetadata")
    }

    @NSManaged public var url: URL?
    @NSManaged public var format: String?
    @NSManaged public var media: Media?

}
