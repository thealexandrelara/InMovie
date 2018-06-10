//
//  MovieTests.swift
//  InMovieTests
//
//  Created by Alexandre Lara on 2018-06-09.
//  Copyright © 2018 Kuoote. All rights reserved.
//

@testable import InMovie

import XCTest
import RealmSwift

class MovieTests: XCTestCase {
    
    var movie: Movie!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        movie = Movie()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIfCanAssignValuesToMovieObject(){
        movie.id = 10
        movie.title = "test"
        movie.posterPath = "test"
        movie.backdropPath = "test"
        movie.originalTitle = "test"
        movie.overview = "test"
        movie.releaseDate = "test"
        movie.budget  = 10
        movie.runtime = 10
        movie.voteAverage = 10
        movie.voteCount = 10
        
        XCTAssertEqual(movie.id, 10)
        XCTAssertEqual(movie.title, "test")
        XCTAssertEqual(movie.posterPath, "test")
        XCTAssertEqual(movie.backdropPath, "test")
        XCTAssertEqual(movie.originalTitle, "test")
        XCTAssertEqual(movie.overview, "test")
        XCTAssertEqual(movie.releaseDate, "test")
        XCTAssertEqual(movie.budget, 10)
        XCTAssertEqual(movie.runtime, 10)
        XCTAssertEqual(movie.voteAverage, 10)
        XCTAssertEqual(movie.voteCount, 10)
    }
    
}
