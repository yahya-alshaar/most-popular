//
//  Date + Format.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/13/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//

import Foundation

extension Date {
    func displayed() -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: Date())
        
        guard let day = components.day else {
            return formatter.string(from: self)
        }
        
        switch (day) {
        case 0:
            return "Today"
        case 1:
            return "Yesterday"
        case 2...6:
            return "\(day) days ago"
        case 7...21:
            let week = Int(day/7)
            return "\(week)w ago"
        default:
            return formatter.string(from: self)
        }
    }
    
    fileprivate var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        
        return formatter
    }
}

