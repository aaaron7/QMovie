//
//  MovieListViewCell.swift
//  QMovie
//
//  Created by aaron on 2018/3/17.
//  Copyright © 2018年 aaron. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class MovieListViewCell : UICollectionViewCell{
    
    lazy var posterImage : UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var movieName : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(posterImage)
        contentView.addSubview(movieName)
        posterImage.snp.makeConstraints { (cm) in
            cm.width.equalTo(self)
            cm.top.equalTo(self)
            cm.bottom.equalTo(movieName.snp.top)
        }
        
        movieName.snp.makeConstraints { (cm) in
            cm.width.equalTo(self)
            cm.height.equalTo(40)
            cm.left.equalTo(self)
            cm.bottom.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func willReloadData(rm : Movie){
        posterImage.sd_setImage(with: URL(string : rm.poster)) { (_, _, _, _) in
            
        }
        
        movieName.text = rm.name
    }
}
