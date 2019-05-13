//
//  AttributesSerializer.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/11/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//

import Foundation

protocol AttributesSerializer {
    func serialize(attributes: [String: Any])
}
