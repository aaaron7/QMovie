//
//  Utility.swift
//  QMovie
//
//  Created by aaron on 2018/3/12.
//  Copyright © 2018年 aaron. All rights reserved.
//

import Foundation

func dateString(from fromDate : Date) -> String{
    let dateF = DateFormatter()
    dateF.dateFormat = "yyyy-MM-dd"
    let dateString = dateF.string(from: fromDate)
    return dateString
}
