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
struct RegisterMovie{
    let objectId : String
    let imdbId : String
    let beginTime : Date
    let endTime : Date
    let availableSeats : Int
    let screenId : String
}
