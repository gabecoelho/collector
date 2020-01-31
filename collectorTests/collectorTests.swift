//
//  collectorTests.swift
//  collectorTests
//
//  Created by Gabriel Coelho on 1/23/20.
//  Copyright © 2020 Gabe. All rights reserved.
//

import XCTest
@testable import collector

class collectorTests: XCTestCase {
    var contentView = ContentView()
    
    override func setUp() {
        super.setUp()
    }
    
    // Test that the app initializes with the right data
    func testContentViewVariablesNotNil() {
        let contentView = ContentView()
        XCTAssertNotNil(contentView.items)
        XCTAssertNotNil(contentView.categories)
        XCTAssertNotNil(contentView.categoryMap)
    }
}
