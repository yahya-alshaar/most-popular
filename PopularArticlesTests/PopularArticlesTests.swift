//
//  PopularArticlesTests.swift
//  PopularArticlesTests
//
//  Created by Yahya Alshaar on 5/11/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//

import XCTest
import Foundation
@testable import PopularArticles

class PopularArticlesTests: XCTestCase {

    func testTimeAgoSettings() {
        let oneDayAgo = Date(timeIntervalSinceNow: -1 * 60 * 60 * 24)
        let oneDayAgoDisplay = oneDayAgo.displayed()
        
        XCTAssertEqual(oneDayAgoDisplay, "Yesterday")
        
        let threeDaysAgo = Date(timeIntervalSinceNow: -3 * 60 * 60 * 24)
        let threeDaysAgoDisplay = threeDaysAgo.displayed()

        XCTAssertEqual(threeDaysAgoDisplay, "3 days ago")
        
        let oneWeekAgo = Date(timeIntervalSinceNow: -7 * 60 * 60 * 24)
        let oneWeekAgoDisplay = oneWeekAgo.displayed()
        
        XCTAssertEqual(oneWeekAgoDisplay, "1w ago")
    }

}
