//
//  ScreenListCell.swift
//  QMovie
//
//  Created by aaron on 2018/3/25.
//  Copyright © 2018年 aaron. All rights reserved.
//

import Foundation
import UIKit

class ScreenListCell : UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews(){
        contentView.addSubview(timeLbl)
        contentView.addSubview(screenName)
        contentView.addSubview(buyBtn)
        contentView.addSubview(priceLbl)
        
        timeLbl.snp.makeConstraints { (cm) in
            cm.left.equalTo(20)
            cm.centerY.equalTo(self.contentView)
            cm.width.equalTo(60)
            cm.height.equalTo(30)
        }
        
        buyBtn.snp.makeConstraints { (cm) in
            cm.height.width.equalTo(timeLbl)
            cm.right.equalTo(self.snp.right).offset(-20)
            cm.centerY.equalTo(self.contentView)
        }
        
        screenName.snp.makeConstraints { (cm) in
            cm.height.equalTo(30)
            cm.width.equalTo(40)
            cm.left.equalTo(timeLbl.snp.right).offset(10)
            cm.centerY.equalTo(self.contentView)
        }
        
        priceLbl.snp.makeConstraints { (cm) in
            cm.width.height.equalTo(screenName)
            cm.right.equalTo(buyBtn.snp.left).offset(-10)
            cm.centerY.equalTo(contentView)
        }
    }
    
    func loadData(rm : RegisterMovie){
        priceLbl.text = "80元"
        timeLbl.text = rm.getCompactBeginTime()
        screenName.text = "todo"
    }
    
    lazy var timeLbl : UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18)
        return view
    }()
    
    lazy var screenName : UILabel = {
        let view = UILabel()
        return view
    }()
    
    lazy var priceLbl : UILabel = {
        let view = UILabel()
        view.textColor = UIColor.red
        return view
    }()
    
    lazy var buyBtn : UIButton = {
        let view = UIButton()
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 5
        view.setTitle("购买", for: .normal)
        return view
    }()
}

