//
//  ArticlesViewModel.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/11/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//

import Foundation
import CoreData

class ArticlesViewModel {
    private let apiKey = "pxV6JXaf7r7ARs8VOSW6iEfkzLjQhLpt"
    var context: NSManagedObjectContext!
    
    enum PeriodKind: Int {
        case day = 1
        case week = 7
        case month = 30
    }
    
    func createUrl(period: PeriodKind = .day) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nytimes.com"
        components.path = "/svc/mostpopular/v2/viewed/\(period.rawValue).json"
        components.queryItems = [
            URLQueryItem(name: "api-key", value: apiKey)
        ]
        
        return components.url
    }
    
    func fetchArticles(success: @escaping () -> (), failure: @escaping ((Error) -> Swift.Void)) {
        
        let session = URLSession(configuration: .default)
        
        guard let url = createUrl() else {
            failure(URLError(.badURL))
            return
        }
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                failure(error)
            }else {
                do {
                    if let data = data {
                        try self.parse(data: data)
                    }
                }catch let error {
                    failure(error)
                }
                
                success()
            }
        }
        
        task.resume()
    }
    
    func parse(data: Data) throws {
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            
            if let results = json["results"] as? [[String: Any]] {
                for attributes in results {
                    let article = Article(context: context)
                    article.serialize(attributes: attributes)
                }
            }
        }
        
    }
}
