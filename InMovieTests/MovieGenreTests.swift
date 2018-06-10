//
//  MovieGenreTests.swift
//  InMovieTests
//
//  Created by Alexandre Lara on 2018-06-09.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import XCTest

@testable import InMovie

class MovieGenreTests: XCTestCase {
    
    var movieGenre: MovieGenre!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        movieGenre = MovieGenre()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIfCanAssignValuesToMovieObject(){
        movieGenre.id = 123134
        movieGenre.name = "test"
        
        XCTAssertEqual(movieGenre.id, 123134)
        XCTAssertEqual(movieGenre.name, "test")
    }
    
}
