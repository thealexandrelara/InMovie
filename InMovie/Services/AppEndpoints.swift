//
//  AppService.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-08.
//  Copyright © 2018 Kuoote. All rights reserved.
//
import Foundation
import Moya

enum AppEndpoints {
    case getUpcomingMovies(params: [String:Any])
    case getMovie(id: Int, params: [String:Any])
    
}

extension AppEndpoints: TargetType {
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL { return URL(string: Constants.config.apiUrl)! }
    var path: String {
        switch self {
        case .getUpcomingMovies(_):
            return "/movie/upcoming"
        case .getMovie(let id, _):
            return "/movie/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUpcomingMovies, .getMovie:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getUpcomingMovies(let params),
             .getMovie(_, let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
}
