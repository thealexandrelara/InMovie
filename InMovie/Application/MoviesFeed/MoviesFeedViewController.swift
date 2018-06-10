//
//  MoviesListViewController.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-06.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation

import UIKit

import RxSwift
import RxCocoa

class MoviesFeedViewController: UIViewController, BindableType {
    
    var viewModel: MoviesFeedViewModel!
    let disposeBag = DisposeBag()
    
    let movieCellId = "movieCellId"
    
    let mainView: MoviesFeedView = {
        let uiv = MoviesFeedView()
        uiv.backgroundColor = .clear
        
        return uiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        registerCells()
        setupNavbarButtons()
        bindUI()
    }
    
    private func setupViews(){
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.edges.equalTo(view.snp.edges)
            }
        }
        
        // Set gradient layer of the view
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [Constants.colors.backgroundGradientStartColor.cgColor, Constants.colors.backgroundGradientEndColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func registerCells(){
        mainView.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: movieCellId)
    }
    
    private func setupNavbarButtons(){
        let searchButton = UIButton(type: .custom)
        searchButton.imageView?.contentMode = .scaleAspectFit
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysTemplate), for: .normal)
        searchButton.tintColor = .white
        
        let searchButtonItem = UIBarButtonItem(customView: searchButton)
        
        searchButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(22)
        }
        
        navigationItem.rightBarButtonItem = searchButtonItem
    }
    
    private func bindUI(){
        
        
        mainView.collectionView.rx.itemSelected
            .map({ [weak self] (indexPath) -> Int in
                guard let movie = self?.viewModel.getMovie(in: indexPath.item) else { return -1 }
                return movie.id ?? -1
            })
            .flatMap({[unowned self] (id) -> Observable<Movie> in
                self.viewModel.getMovie(id: id)
            })
            .subscribe(viewModel.detailAction.inputs)
            .disposed(by: disposeBag)
        
        mainView.collectionView.rx.didScroll
            .filter({ [unowned self] _ -> Bool in
                let offset: CGFloat = 200.0
                let scrollViewOffset = self.mainView.collectionView.contentOffset
                let bottomEdge = scrollViewOffset.x + self.mainView.collectionView.frame.width
                if (bottomEdge + offset >= self.mainView.collectionView.contentSize.width) {
                    return true
                } else {
                    return false
                }
            })
            .throttle(1.0, scheduler: MainScheduler.instance)
            .map({[unowned self] _ in return self.viewModel.currentPage+1})
            .subscribe(viewModel.loadMoviesAction.inputs)
            .disposed(by: disposeBag)
    }
    
    func bindViewModel() {
        
        viewModel.movies
            .bind(to: mainView.collectionView.rx.items(cellIdentifier: movieCellId, cellType: MovieCell.self)) { (row, element, cell) in
                cell.movieTitleLabel.text = element.title
                
                if let releaseDateString = element.releaseDate {
                    let dateFormatter = DateFormatter()
                    
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let releaseDate = dateFormatter.date(from: releaseDateString)
                    
                    dateFormatter.dateFormat = "dd MMMM yyyy"
                    dateFormatter.locale = Locale(identifier: "pt_BR")
                    
                    if let finalReleaseDate = releaseDate {
                        var dateString = dateFormatter.string(from: finalReleaseDate)
                        dateString = dateString.replacingOccurrences(of: " ", with: " de ")
                        
                        cell.movieReleaseDateLabel.text = dateString
                    }
                } else {
                    cell.movieReleaseDateLabel.isHidden = true
                }
                
                if let posterPath = element.posterPath {
                    cell.imageView.kf.setImage(with: URL(string: DataParser.getImagePosterUrl(path: posterPath)))
                }
            }
            .disposed(by: disposeBag)
        
        
        
    }
}
