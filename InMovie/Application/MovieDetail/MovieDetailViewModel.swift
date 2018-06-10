//
//  MovieDetailViewModel.swift
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

struct MovieDetailViewModel {
    private let sceneCoordinator: SceneCoordinatorType
    
    private let _movie = BehaviorSubject<Movie?>(value: nil)
    
    var movie: Driver<Movie?> {
        return _movie.asDriver(onErrorJustReturn: nil)
    }
    
    lazy var backButtonAction: CocoaAction = { this in
        return CocoaAction { _ in
            return this.sceneCoordinator.pop(animated: true).asObservable().map({ (_) -> Void in
                return ()
            })
        }
    }(self)
    
    init(movie: Movie, coordinator: SceneCoordinatorType) {
        self._movie.onNext(movie)
        self.sceneCoordinator = coordinator
        self.saveMovie(movie: movie)
    }
    
    private func saveMovie(movie: Movie){
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(movie, update: true)
            }
        } catch let error as NSError {
            print(error)
        }
        
    }
}
