//
//  MovieUpcomingResult.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-07.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation

import ObjectMapper

import RealmSwift

class MovieUpcomingResult: Object, Mappable {
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [Movie]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
        results <- map["results"]
    }
    
//    required init(map: Mapper) throws {
//        page = map.optionalFrom("page")
//        totalResults = map.optionalFrom("total_results")
//        totalPages = map.optionalFrom("total_pages")
//        results = map.optionalFrom("results")
//    }
}
