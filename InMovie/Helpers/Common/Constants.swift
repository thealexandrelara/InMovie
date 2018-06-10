//
//  Constants.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-07.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import UIKit

struct Constants {
    
    struct config {
        static let apiUrl = "https://api.themoviedb.org/3"
        static let apiKey = "f92f89dd5d2d12eab7fbc4c251dc69ce"
        static let imagePosterUrl = "https://image.tmdb.org/t/p/w185"
        static let imageBackdropUrl = "https://image.tmdb.org/t/p/w300"
    }
    
    struct colors {
        static let text = UIColor.rgb(red: 120, green: 120, blue: 135, alpha: 1.0)
        static let lightText = UIColor.white
        static let lineSeparator = UIColor.rgb(red: 55, green: 55, blue: 65, alpha: 1.0)
        static let backgroundGradientStartColor = UIColor.rgb(red: 20, green: 20, blue: 25, alpha: 1.0)
        static let backgroundGradientThreeQuarterColor = UIColor.rgb(red: 20, green: 20, blue: 25, alpha: 0.75)
        static let backgroundGradientStartHalfColor = UIColor.rgb(red: 20, green: 20, blue: 25, alpha: 0.5)
        static let backgroundGradientStartQuarterColor = UIColor.rgb(red: 20, green: 20, blue: 25, alpha: 0.25)
        static let backgroundGradientEndColor = UIColor.rgb(red: 30, green: 30, blue: 40, alpha: 1.0)
    }
    
}
