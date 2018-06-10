//
//  Movie.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-07.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation

import ObjectMapper
import RealmSwift

import ObjectMapper_Realm

class Movie: Object, Mappable {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    var genres: List<MovieGenre>?
    @objc dynamic var posterPath: String?
    @objc dynamic var backdropPath: String?
    @objc dynamic var originalTitle: String?
    @objc dynamic var overview: String?
    @objc dynamic var releaseDate: String?
    @objc dynamic var budget: Int = 0
    @objc dynamic var runtime: Int = 0
    @objc dynamic var voteAverage: Double = 0
    @objc dynamic var voteCount: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        genres <- map["genres"]
        posterPath <- map["poster_path"]
        backdropPath <- map["backdrop_path"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
        budget <- map["budget"]
        runtime <- map["runtime"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
    }
    
//    init(map: Mapper) throws {
//        id = map.optionalFrom("id")
//        title = map.optionalFrom("title")
////        genres = map.optionalFrom("genres")
//        posterPath = map.optionalFrom("poster_path")
//        backdropPath = map.optionalFrom("backdrop_path")
//        originalTitle = map.optionalFrom("original_title")
//        overview = map.optionalFrom("overview")
//        releaseDate = map.optionalFrom("release_date")
//        budget = map.optionalFrom("budget")
//        runtime = map.optionalFrom("runtime")
//        voteAverage = map.optionalFrom("vote_average")
//        voteCount = map.optionalFrom("vote_count")
//    }
    
//    init() {}
}
