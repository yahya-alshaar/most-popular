//
//  Media+CoreDataClass.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/11/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Media)
public class Media: NSManagedObject {
    enum MediaKind: String {
        case image = "image"
    }
}
extension Media: AttributesSerializer {
    func serialize(attributes: [String : Any]) {
        if let type = attributes["type"] as? String {
          self.type = type
        }
        
        if let caption = attributes["caption"] as? String {
            self.caption = caption
        }
        
        if let copyright = attributes["copyright"] as? String {
            self.copyright = copyright
        }
        
        guard let context = managedObjectContext else {
            return
        }
        
        if let metadata = attributes["media-metadata"] as? [[String: Any]] {
            
            for data in metadata {
                let meta = MediaMetadata(context: context)
                meta.serialize(attributes: data)
                
                addToMetadata(meta)
            }
        }
    }
    
    
}
