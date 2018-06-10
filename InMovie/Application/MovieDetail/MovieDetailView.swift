//
//  MovieDetailView.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-07.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import UIKit

import RealmSwift

class MovieDetailView: UIView {
    
    var backButton: UIButton = {
        let uiv = UIButton(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
        uiv.imageView?.contentMode = .scaleAspectFit
        uiv.setImage(#imageLiteral(resourceName: "arrow").withRenderingMode(.alwaysTemplate), for: .normal)
        uiv.tintColor = .white
        
        return uiv
    }()
    
    let scrollView: UIScrollView = {
        let uiv = UIScrollView()
        uiv.bounces = false
        
        return uiv
    }()
    
    
    let imageView: UIImageView = {
        let uiv = UIImageView()
        uiv.image = #imageLiteral(resourceName: "avengers_wide")
//        uiv.contentMode = .scaleAspectFill
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 240)
        gradient.colors = [Constants.colors.backgroundGradientStartQuarterColor.cgColor, Constants.colors.backgroundGradientStartQuarterColor.cgColor, Constants.colors.backgroundGradientStartQuarterColor.cgColor, Constants.colors.backgroundGradientStartQuarterColor.cgColor, Constants.colors.backgroundGradientStartColor.cgColor]
        gradient.locations = [0.0, 0.3, 0.5, 0.7, 1.0]
        
        uiv.layer.addSublayer(gradient)
        
        return uiv
    }()
    
    let moviesTitleLabel: UILabel = {
        let uiv = UILabel()
        uiv.font = UIFont.overrideSystemFont(ofSize: 24)
        uiv.textColor = Constants.colors.lightText
        uiv.text = "[Title]"
        uiv.numberOfLines = 0
        
        return uiv
    }()
    
    let mainStackView: UIStackView = {
        let uiv = UIStackView()
        uiv.axis = .vertical
        uiv.spacing = 16.0
        
        return uiv
    }()
    
    
    let contentStackView: UIStackView = {
        let uiv = UIStackView()
        uiv.axis = .vertical
        uiv.spacing = 16.0
        uiv.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
        uiv.isLayoutMarginsRelativeArrangement = true
        
        return uiv
    }()
    
    let genresStackView: UIStackView = {
        let uiv = UIStackView()
        uiv.spacing = 4.0
        uiv.distribution = .equalSpacing
        uiv.distribution = .fill
        uiv.alignment  = .leading
        
        return uiv
    }()
    
    let statsInfoStackView: UIStackView = {
        let uiv = UIStackView()
        uiv.axis = .horizontal
        uiv.distribution = .fillEqually
        uiv.spacing = 4.0
        
        return uiv
    }()
    
    let posterAndGeneralInfoStackView: UIStackView = {
        let uiv = UIStackView()
        uiv.axis = .horizontal
        uiv.spacing = 16.0
        
        return uiv
    }()
    
    let generalInfoContainerStackView: UIStackView = {
        let uiv = UIStackView()
        uiv.axis = .vertical
        uiv.spacing = 4.0
        uiv.distribution = .equalSpacing
        
        return uiv
    }()
    
    let generalInfoStackView: UIStackView = {
        let uiv = UIStackView()
        uiv.axis = .vertical
        uiv.spacing = 4.0
        
        return uiv
    }()
    
    let posterImageView: UIImageView = {
        let uiv = UIImageView()
        uiv.image = #imageLiteral(resourceName: "avengers")
        //        uiv.contentMode = .scaleAspectFill
        
        return uiv
    }()
    
    let overviewTitleLabel: UILabel = {
        let uiv = UILabel()
        uiv.text = "Sinopse"
        uiv.font = UIFont.overrideSystemFont(ofSize: 18, weight: .bold)
        uiv.textColor = Constants.colors.lightText
        uiv.numberOfLines = 0
        
        return uiv
    }()
    
    let overviewDescriptionLabel: UILabel = {
        let uiv = UILabel()
        uiv.font = UIFont.overrideSystemFont(ofSize: 14)
        uiv.textColor = Constants.colors.text
        uiv.numberOfLines = 0
        
        return uiv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(imageView)
        mainStackView.addArrangedSubview(contentStackView)
        contentStackView.addArrangedSubview(genresStackView)
        addContentLineSeparator()
        contentStackView.addArrangedSubview(statsInfoStackView)
        addContentLineSeparator()
        contentStackView.addArrangedSubview(posterAndGeneralInfoStackView)
        contentStackView.addArrangedSubview(overviewTitleLabel)
        contentStackView.addArrangedSubview(overviewDescriptionLabel)
        
        posterAndGeneralInfoStackView.addArrangedSubview(posterImageView)
        posterAndGeneralInfoStackView.addArrangedSubview(generalInfoContainerStackView)
        
        generalInfoContainerStackView.addArrangedSubview(generalInfoStackView)
        generalInfoContainerStackView.addArrangedSubview(UILabel())
        
        mainStackView.addSubview(backButton)
        
        imageView.addSubview(moviesTitleLabel)
        
        backButton.snp.makeConstraints { (make) in
            print(UIDevice.current.model)
            if #available(iOS 11.0, *) {
                make.top.equalToSuperview().inset(48)
                make.left.equalToSuperview().inset(16)
            } else {
                make.top.equalToSuperview().inset(24)
                make.left.equalToSuperview().inset(16)
            }
            make.width.height.equalTo(22)
        }
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(240)
        }

        moviesTitleLabel.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview().inset(16)
        }
        
        mainStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.bottom.equalToSuperview()
        }
        
        statsInfoStackView.snp.makeConstraints { (make) in
            make.height.equalTo(60)
        }
        
        posterImageView.snp.makeConstraints { (make) in
            make.height.equalTo(180)
            make.width.equalTo(140)
        }
        
        
//        make.top.equalToSuperview().inset(16)
//        make.left.equalTo(snp.left).inset(16)
//        make.right.equalTo(snp.right).inset(16)
//        make.bottom.equalToSuperview().inset(16)
        
    }
    
    func setTitle(title: String?, year: String?){
        guard let title = title, let year = year else { return }
        let attributedText = NSMutableAttributedString(string: title, attributes: [.font: UIFont.overrideSystemFont(ofSize: 24, weight: .bold), .foregroundColor: Constants.colors.lightText])
        attributedText.append(NSAttributedString(string: " (\(year))", attributes: [.font: UIFont.overrideSystemFont(ofSize: 18), .foregroundColor: Constants.colors.lightText]))
        
        moviesTitleLabel.attributedText = attributedText
    }
    
    func createInfo(title: String?, description: String?, isStatsInfo: Bool=false, withLineSeparator: Bool){
        let infoStackView = UIStackView()
        infoStackView.axis = .vertical
        infoStackView.spacing = 4.0
        infoStackView.alignment = .center
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.overrideSystemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = Constants.colors.lightText
        titleLabel.textAlignment = .center
        titleLabel.text = title
        titleLabel.numberOfLines = 0
    
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.overrideSystemFont(ofSize: 14)
        descriptionLabel.textColor = Constants.colors.text
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = description
        descriptionLabel.numberOfLines = 0
        
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(descriptionLabel)
        
        statsInfoStackView.addArrangedSubview(infoStackView)
    }
    
    func createGeneralInfo(title: String, description: String, isLast: Bool = false){
        
        let infoLabel = UILabel()
        infoLabel.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: "\(title): ", attributes: [.font: UIFont.overrideSystemFont(ofSize: 14, weight: .bold), .foregroundColor: Constants.colors.text])
        attributedText.append(NSAttributedString(string: "\(description)", attributes: [.font: UIFont.overrideSystemFont(ofSize: 14), .foregroundColor: Constants.colors.lightText]))
        
        infoLabel.attributedText = attributedText
        
        generalInfoStackView.addArrangedSubview(infoLabel)
        
        if isLast {
            generalInfoStackView.addArrangedSubview(UIStackView())
        }
    }
    
    func setup(genres: List<MovieGenre>){
        
        var totalWidth: CGFloat = 0.0
        
        genres.forEach { (genre) in
            let genreLabel = GenreLabel()
            genreLabel.text = genre.name
            genreLabel.textColor = Constants.colors.text
            genreLabel.font = UIFont.overrideSystemFont(ofSize: 14)
            genreLabel.layer.borderWidth = 1.0
            genreLabel.layer.borderColor = Constants.colors.lineSeparator.cgColor
            genreLabel.layer.cornerRadius = 3.0
            
            genreLabel.snp.makeConstraints({ (make) in
                make.width.equalTo(genreLabel.intrinsicContentSize.width)
                totalWidth = totalWidth + genreLabel.intrinsicContentSize.width
            })
            
            if totalWidth > UIScreen.main.bounds.width - 32.0 {
                return
            }
            
            genresStackView.addArrangedSubview(genreLabel)
        }
        
        if totalWidth < UIScreen.main.bounds.width - 32.0 {
            let dummyLabel = UILabel()
            genresStackView.addArrangedSubview(dummyLabel)
        }
    }
    
    func addContentLineSeparator(){
        let lineSeparator = UIView()
        lineSeparator.backgroundColor = Constants.colors.lineSeparator
        
        lineSeparator.snp.makeConstraints { (make) in
            make.height.equalTo(1)
        }
        
        contentStackView.addArrangedSubview(lineSeparator)
    }
}
