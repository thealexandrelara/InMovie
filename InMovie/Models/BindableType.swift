//
//  BindableType.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-06.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import UIKit

protocol BindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

extension BindableType where Self: UIViewController {
    
    mutating func bindViewModel(to model: Self.ViewModelType){
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
    
}
