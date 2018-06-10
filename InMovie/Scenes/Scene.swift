//
//  Scene.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-06.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation

import UIKit

enum Scene {
    case moviesList(MoviesFeedViewModel)
    case movieDetail(MovieDetailViewModel)
}

extension Scene {
    func viewController() -> UIViewController {
        switch self {
        case .moviesList(let viewModel):
            let nc = UINavigationController(rootViewController: MoviesFeedViewController())
            var vc = nc.viewControllers.first! as! MoviesFeedViewController
            
            vc.bindViewModel(to: viewModel)
            
            return vc
        case .movieDetail(let viewModel):
            var vc = MovieDetailViewController()
            
            vc.bindViewModel(to: viewModel)
            
            return vc
            
        }
    }
}
