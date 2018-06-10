//
//  DataParser.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-08.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation

class DataParser {
    
    static func getImagePosterUrl(path: String) -> String {
        return Constants.config.imagePosterUrl + path
    }
    
    static func getBackdropPosterUrl(path: String) -> String {
        return Constants.config.imageBackdropUrl + path
    }
    
    static func getDate(date: String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: date)
    }
}
