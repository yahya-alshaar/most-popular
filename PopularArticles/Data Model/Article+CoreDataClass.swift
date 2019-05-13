//
//  Article+CoreDataClass.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/11/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject {
    
    func photos(kind: MediaMetadata.FormatKind) -> URL? {
    
        let images = media.filter { (_media) -> Bool in
            return _media.type == Media.MediaKind.image.rawValue
        }
        
        for image in images {
            return image.metadata.first { (meta) -> Bool in
                return meta.format == kind.rawValue
            }?.url
        }
        
        return nil
    }
    
    fileprivate func checkMediaExsitnce(stringURL: String) -> Bool {
        
        let fr: NSFetchRequest<MediaMetadata> = MediaMetadata.fetchRequest()
        fr.predicate = NSPredicate(format: "url == %@", stringURL)
        let mainContext = App.dataStack.persistentContainer.viewContext
        
        do {
            return (try mainContext.count(for: fr) > 0) // media exsit
        }catch {}
        
        return false
    }
}

extension Article: AttributesSerializer {
    func serialize(attributes: [String: Any]) {
        if let id = attributes["id"] as? Int64 {
            self.id = id
        }
        
        if let stringDate = attributes["published_date"] as? String {
            self.publishedAt = formatter.date(from: stringDate)
        }
        
        if let title = attributes["title"] as? String {
            self.title = title
        }
        
        if let stringURL = attributes["url"] as? String {
            self.url = URL(string: stringURL)
        }
        
        if let numberOfViews = attributes["views"] as? Int32 {
            self.numberOfViews = numberOfViews
        }
        
        if let source = attributes["source"] as? String {
            self.source = source
        }
        
        if let abstract = attributes["abstract"] as? String {
            self.abstract = abstract
        }
        
        guard let context = managedObjectContext else {
            return
        }
        
        for attributes in attributes["media"] as? [[String: Any]] ?? [] {

            guard
                let metaAttributes = attributes["media-metadata"] as? [[String: Any]],
                let stringURL = metaAttributes.first?["url"] as? String,
                checkMediaExsitnce(stringURL: stringURL) == false
                else {
                    continue
            }
            
            let media = Media(context: context)
            media.serialize(attributes: attributes)
            
            addToMedia(media)
        }
    }
    
    
}

extension Article {
    fileprivate var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }
}
