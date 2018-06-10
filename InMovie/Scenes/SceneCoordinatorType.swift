//
//  SceneCoordinatorType.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-06.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation

import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, type: SceneTransitionType) -> Completable
    
    @discardableResult
    func pop(animated: Bool) -> Completable
}

extension SceneCoordinatorType {
    @discardableResult
    func pop() -> Completable {
        return pop(animated: true)
    }
}
