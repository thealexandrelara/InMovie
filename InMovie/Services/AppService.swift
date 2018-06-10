//
//  AppService.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-08.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

import Moya_ObjectMapper

import RealmSwift

protocol AppServiceType {
    func getUpcomingMovies(parameters: [String: Any]) -> Observable<MovieUpcomingResult>
    func getMovie(id: Int, parameters: [String: Any]) -> Observable<Movie>
}

class AppService: AppServiceType {
    
    let provider = MoyaProvider<AppEndpoints>()
    let disposeBag = DisposeBag()

    func getUpcomingMovies(parameters: [String: Any]) -> Observable<MovieUpcomingResult> {
        return provider.rx.request(.getUpcomingMovies(params: parameters))
            .mapObject(MovieUpcomingResult.self)
            .asObservable()
    }
    
    func getMovie(id: Int, parameters: [String: Any]) -> Observable<Movie> {
        
        return provider.rx.request(.getMovie(id: id, params: parameters))
            .mapObject(Movie.self)
            .asObservable()
    }
    
}
