//
//  MovieCell.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-07.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let uiv = UIImageView()
        uiv.image = #imageLiteral(resourceName: "avengers")
        uiv.contentMode = .scaleAspectFill
        uiv.layer.cornerRadius = 5.0
        uiv.layer.masksToBounds = true
        uiv.clipsToBounds = true
        
        return uiv
    }()
    
    let movieReleaseDateLabel: UILabel = {
        let uiv = UILabel()
        uiv.numberOfLines = 0
        uiv.text = "[Date]"
        uiv.textColor = Constants.colors.lightText
        uiv.font = UIFont.overrideSystemFont(ofSize: 14, weight: .bold)
        uiv.textAlignment = .center
        
        return uiv
    }()
    
    let movieTitleLabel: UILabel = {
        let uiv = UILabel()
        uiv.numberOfLines = 0
        uiv.text = "[Title]"
        uiv.textColor = Constants.colors.lightText
        uiv.font = UIFont.overrideSystemFont(ofSize: 22, weight: .bold)
        
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
        addSubview(imageView)
        addSubview(movieReleaseDateLabel)
        addSubview(movieTitleLabel)
        
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(360)
        }
        movieReleaseDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.right.left.equalToSuperview()
        }
        
        movieTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(movieReleaseDateLabel.snp.bottom).offset(8)
            make.right.left.equalToSuperview()
        }
    }
}
