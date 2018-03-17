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

func utcStringDate(from : String)->Date{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    let date = dateFormatter.date(from: from)
    return date!
}
