//
//  MovieDetailViewModelTests.swift
//  InMovieTests
//
//  Created by Alexandre Lara on 2018-06-09.
//  Copyright © 2018 Kuoote. All rights reserved.
//

@testable import InMovie

import XCTest

class MovieUpcomingResultTests: XCTestCase {
    
    var movieUpcomingResult: MovieUpcomingResult!
    
    override func setUp() {
        super.setUp()
        
        movieUpcomingResult = MovieUpcomingResult()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIfMovieDetailViewModelIsProperlyInitialized() {
        movieUpcomingResult.page = 123134
        movieUpcomingResult.totalResults = 12
        movieUpcomingResult.totalPages = 13
        movieUpcomingResult.results = [Movie(), Movie(), Movie()]
        
        XCTAssertEqual(movieUpcomingResult.page, 123134)
        XCTAssertEqual(movieUpcomingResult.totalResults, 12)
        XCTAssertEqual(movieUpcomingResult.totalPages, 13)
        XCTAssertEqual(movieUpcomingResult.results?.count, 3)
    }
    
}
