//
//  MovieListView.swift
//  QMovie
//
//  Created by aaron on 2018/3/11.
//  Copyright © 2018年 aaron. All rights reserved.
//

import UIKit

protocol MovieListViewDataSource {
    func getMovies() -> [Movie]
}

class MovieListView: UIView{

    var dataSource : MovieListViewDataSource?
    
    let cellWidth = 110.0
    let widthHeightRatio = 270.0 / 378
    
    var selectedIndexPath : IndexPath?
    
    lazy var contentView : UICollectionView = {
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: contentViewLayout)
        view.register(MovieListViewCell.classForCoder(), forCellWithReuseIdentifier: "MovieListViewCell")
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var contentViewLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        return layout
    }()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() -> Void {
        addSubview(contentView)
        contentView.snp.makeConstraints { (cm) in
            cm.edges.equalTo(self)
        }
        
        contentView.contentSize = CGSize(width: 1000, height: 100)
    }
    
    func reloadData() -> Void{
        contentView.reloadData()
    }
}

extension MovieListView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func updateTransform(){
        guard let _ = selectedIndexPath else{
            return
        }
        
        let visibleCells = contentView.visibleCells
        
        let cell = contentView.cellForItem(at: selectedIndexPath!)
        UIView.animate(withDuration: 0.3) {
            for i in 0..<visibleCells.count{
                visibleCells[i].transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
            
            cell?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let delegate = dataSource{
            return delegate.getMovies().count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:MovieListViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieListViewCell", for: indexPath) as? MovieListViewCell
        
        if cell == nil{
            cell = MovieListViewCell(frame: CGRect.zero)
        }
        
        if let c = cell{
            if let delegate = dataSource{
                c.willReloadData(rm: delegate.getMovies()[indexPath.item])
            }
        }
        
        updateTransform()
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellWidth / widthHeightRatio + 40)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        updateTransform()
    }
}
