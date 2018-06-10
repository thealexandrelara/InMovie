//
//  MoviesFeedView.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-06.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import UIKit
import SnapKit

class MoviesFeedView: UIView {
    
    let mainStackView: UIStackView = {
        let uiv = UIStackView()
        uiv.axis = .vertical
        uiv.spacing = 16.0
        
        return uiv
    }()
    
    let moviesCategoryLabel: UILabel = {
        let uiv = UILabel()
        uiv.font = UIFont.overrideSystemFont(ofSize: 24)
        uiv.textColor = Constants.colors.lightText
        uiv.text = "Próximos filmes"
        
        return uiv
    }()
    
    let collectionView: UICollectionView = {        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: 240, height: 360+90)
        
        let uiv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        uiv.backgroundColor = .clear
        uiv.showsHorizontalScrollIndicator = false
        uiv.showsVerticalScrollIndicator = false
        
        
        return uiv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(moviesCategoryLabel)
        mainStackView.addArrangedSubview(collectionView)
        
        mainStackView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(360+90)
            make.width.equalTo(240)

        }
        
    }
    
}
