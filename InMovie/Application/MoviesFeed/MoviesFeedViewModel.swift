//
//  MoviesListViewModel.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-06.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa
import Action

import RealmSwift


class MoviesFeedViewModel {
    
    let disposeBag = DisposeBag()
    
    let sceneCoordinator: SceneCoordinatorType
    let appService: AppService
    
    private let _movies = BehaviorRelay<[Movie]>(value: [])
    var currentPage = 1
    var maxPages = 1
    
    var movies: Observable<[Movie]>{
        return _movies.asObservable()
    }
    
    lazy var detailAction: Action<Movie, Swift.Never> = { this in
        return Action { movie in
            let movieDetailViewModel = MovieDetailViewModel(movie: movie, coordinator: this.sceneCoordinator)
            
            return this.sceneCoordinator
                .transition(to: Scene.movieDetail(movieDetailViewModel), type: .modal)
                .asObservable()
        }
    }(self)
    
    lazy var loadMoviesAction: Action<Int, Swift.Never> = { this in
        let subject = PublishSubject<Void>()
        
        return Action { page in
            this.loadMoviesResult(page: page)
                .do(onNext: { _ in
                    subject.onCompleted()
                })
                .bind(to: this._movies)
                .disposed(by: this.disposeBag)
            
            return subject
                .asObservable()
                .take(1)
                .ignoreElements()
                .asObservable()
        }
        
    }(self)
    
    init(appService: AppService, coordinator: SceneCoordinatorType) {
        self.sceneCoordinator = coordinator
        self.appService = appService
        
        loadMoviesResult(page: 1)
            .bind(to: _movies)
            .disposed(by: disposeBag)
    }
    
    func getMovie(in position: Int) -> Movie {
        let selectedMovie = _movies.value[position]
        
        return selectedMovie
    }
    
    @discardableResult
    private func loadMoviesResult(page: Int) -> Observable<[Movie]>{
        var parameters: [String:Any] = [:]
        parameters["api_key"] = Constants.config.apiKey
        parameters["language"] = "pt-BR"
//        parameters["region"] = "BR"
        parameters["page"] = page
        
        if page > maxPages { return Observable.empty()}
        
        return appService.getUpcomingMovies(parameters: parameters)
            .do(onNext: {[weak self](movieResult) in
                guard let page = movieResult.page, let totalPages = movieResult.totalPages else {
                    return
                }
                self?.currentPage = page
                self?.maxPages = totalPages
            })
            .map {[unowned self] (movieResult) -> [Movie] in
                guard let movies = movieResult.results else { return [] }
                
                var moviesResults = self._movies.value + movies
                
                // Filter movies already released
                moviesResults = moviesResults.filter({ (movie) -> Bool in
                    guard let releaseDateString = movie.releaseDate, let releaseDate = DataParser.getDate(date: releaseDateString, format: "yyyy-MM-dd") else { return false }
                    
                    guard let todayDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()), let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: todayDate) else { return false }
                    
                    return releaseDate > yesterdayDate
                    
                })
                
                return moviesResults
            }
            .take(1)
        
    }
    
    func getMovie(id: Int) -> Observable<Movie> {
        var parameters: [String:Any] = [:]
        parameters["api_key"] = Constants.config.apiKey
        parameters["language"] = "pt-BR"
        
        return appService.getMovie(id: id, parameters: parameters)
                .asObservable()
        
    }
    
    private func getRealmMovies(){
        
        do {
            let realm = try Realm()
            let movies = realm.objects(Movie.self).toArray(type: Movie.self)
            
            _movies.accept(movies)
        } catch let error as NSError {
            print(error)
        }
    }
    
    
    
}
