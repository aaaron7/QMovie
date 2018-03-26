//
//  RegisterMovie.swift
//  QMovie
//
//  Created by aaron on 2018/3/11.
//  Copyright © 2018年 aaron. All rights reserved.
//

import Foundation

/*
 代表上映的电影，如每天上映的电影就应该是一条RegisterMovie的list
 */
class RegisterMovie : Codable{
    let objectId : String
    let imdbId : String
    let beginTime : String
    let endTime : String
    let availableSeats : Int
    let screenId : String
    let createdAt : String
    let updatedAt : String
    var MovieInfo : Movie?
    
    lazy var originalBeginTime : Date = {
        let date = utcStringDate(from: beginTime)
        return date
    }()
    
    func getCompactBeginTime()->String{
        let result = dateString(from: self.originalBeginTime, format: "HH:mm")
        return result
    }
}

