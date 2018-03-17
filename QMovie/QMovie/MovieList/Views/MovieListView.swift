//
//  MovieListView.swift
//  QMovie
//
//  Created by aaron on 2018/3/11.
//  Copyright © 2018年 aaron. All rights reserved.
//

import UIKit

protocol MovieListViewDataSource {
    func registerMoviesToday() -> [RegisterMovie]
}

class MovieListView: UIView, UICollectionViewDataSource, UICollectionViewDelegate{

    var dataSource : MovieListViewDataSource?
    
    lazy var contentView : UICollectionView = {
        let view = UICollectionView()
        return view
    }()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}

extension MovieListView{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let delegate = dataSource{
            return delegate.registerMoviesToday().count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    
}
