//
//  ScreenListView.swift
//  QMovie
//
//  Created by aaron on 2018/3/11.
//  Copyright © 2018年 aaron. All rights reserved.
//

import UIKit

protocol ScreenListViewDataSource {
    func getScreenList() -> [RegisterMovie]
}

class ScreenListView: UIView {

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
    
    var delegate : ScreenListViewDataSource?
    
    lazy var contentView : UITableView = {
        let view = UITableView(frame: CGRect.zero, style: .plain)
        view.dataSource = self
        view.delegate = self
        
        view.register(ScreenListCell.classForCoder(), forCellReuseIdentifier: "ScreenListCell")
        return view
    }()
    
    func setupViews(){
        addSubview(contentView)
        
        contentView.snp.makeConstraints { (cm) in
            cm.edges.equalTo(self)
        }
    }
    
    func reload(){
        contentView.reloadData()
    }
    
    func dataSources() -> [RegisterMovie]{
        if let ds = delegate{
            return ds.getScreenList()
        }else{
            return []
        }
    }
}

extension ScreenListView : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:ScreenListCell? = tableView.dequeueReusableCell(withIdentifier: "ScreenListCell", for: indexPath) as? ScreenListCell
        
        if cell == nil{
            cell = ScreenListCell(style: .default, reuseIdentifier: "ScreenListCell")
        }
        
        cell?.loadData(rm: dataSources()[indexPath.row])
        
        return cell!
    }
}
