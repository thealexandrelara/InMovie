//
//  MovieDetailViewController.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-06.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation

import UIKit

import RxSwift
import RxCocoa

class MovieDetailViewController: UIViewController, BindableType {
    
    var viewModel: MovieDetailViewModel!
    let disposeBag = DisposeBag()
    
    let mainView: MovieDetailView = {
        let uiv = MovieDetailView()
        uiv.backgroundColor = UIColor.clear
        
        return uiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        bindUI()
    }
    
    func bindUI(){
        mainView.backButton.rx.action = viewModel.backButtonAction
    }
    
    func bindViewModel() {
        viewModel.movie
            .drive(onNext: { [weak self] movie in
                guard let movie = movie else { return }
                self?.setup(movie: movie)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupViews(){
        view.backgroundColor = Constants.colors.backgroundGradientStartColor
        
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        
    }
    
    private func setup(movie: Movie){
        // Title
        if movie.title != "", let releaseDate = movie.releaseDate {
            mainView.setTitle(title: movie.title, year: String(releaseDate.prefix(4)))
        }
        
        if let posterPath = movie.posterPath {
            mainView.posterImageView.kf.setImage(with: URL(string: DataParser.getImagePosterUrl(path: posterPath)))
        }
        
        if let wallpaperPath = movie.backdropPath {
            mainView.imageView.kf.setImage(with: URL(string: DataParser.getBackdropPosterUrl(path: wallpaperPath)))
        } else {
            if let posterPath = movie.posterPath {
                mainView.imageView.kf.setImage(with: URL(string: DataParser.getImagePosterUrl(path: posterPath)))
            }
        }
        
        // Overview
        if let overview = movie.overview, !overview.isEmpty {
            mainView.overviewDescriptionLabel.text = overview
        } else {
            mainView.overviewTitleLabel.isHidden = true
        }

        // Genre
        if let genres = movie.genres {
            mainView.setup(genres: genres)
        }

        // Budget
        if movie.budget >= 0 {
            let budget = movie.budget
            var remainder = 0.0
            if Double(budget)/1000000000.0 > 1 {
                mainView.createInfo(title: "\(Int(Double(budget)/1000000000.0))B", description: "Em Orçamento", withLineSeparator: false)
            } else if Double(budget)/1000000.0 > 1 {
                mainView.createInfo(title: "\(Int(Double(budget)/1000000.0))M", description: "Em Orçamento", withLineSeparator: false)
                
            } else if Double(budget)/1000.0 > 1 {
                mainView.createInfo(title: "\(Int(Double(budget)/1000.0))m", description: "Em Orçamento", withLineSeparator: false)
            } else {
                mainView.createInfo(title: "\(budget)m", description: "Em Orçamento", withLineSeparator: false)
            }
        }

        // Rating
        mainView.createInfo(title: "\(movie.voteAverage)/10", description: "De \(movie.voteCount) Votos", withLineSeparator: false)
        
        // Runtime
        if movie.runtime > 0 {
            mainView.createInfo(title: "\(movie.runtime/60)h\(movie.runtime%60)m", description: "Duração", withLineSeparator: false)
        } else {
            mainView.createInfo(title: "N/A", description: "Duração", withLineSeparator: false)
        }
        
        // General Info - Title
        if !movie.title.isEmpty {
            mainView.createGeneralInfo(title: "Titulo", description: movie.title)
        }
        
        // General Info - Original Title
        if let originalTitle = movie.originalTitle {
            mainView.createGeneralInfo(title: "Titulo original", description: originalTitle)
            
        }
        
        // General Info - Original Title
        if let releaseDate = movie.releaseDate {
            mainView.createGeneralInfo(title: "Data de lançamento", description: releaseDate)
        }
        
    }
    
    
}
