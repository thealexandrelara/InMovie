//
//  MovieGenre.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-08.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation

import ObjectMapper

import RealmSwift

class MovieGenre: Object, Mappable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String? = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
//    required init(map: Mapper) throws {
//        id = try map.from("id")
//        name = map.optionalFrom("name")
//    }
}
