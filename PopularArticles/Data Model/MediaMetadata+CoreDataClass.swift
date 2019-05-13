//
//  MediaMetadata+CoreDataClass.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/13/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(MediaMetadata)
public class MediaMetadata: NSManagedObject {
    enum FormatKind: String {
        case thumbnial = "Standard Thumbnail"
        case threeByTwo210 = "mediumThreeByTwo210"
        case threeByTwo440 = "mediumThreeByTwo440"
    }
}

extension MediaMetadata: AttributesSerializer {
    func serialize(attributes: [String : Any]) {
        if let stringURL = attributes["url"] as? String {
            self.url = URL(string: stringURL)
        }
        
        if let format = attributes["format"] as? String {
            self.format = format
        }
    }
    
}
