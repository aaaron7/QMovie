//
//  Movie.swift
//  QMovie
//
//  Created by aaron on 2018/3/11.
//  Copyright © 2018年 aaron. All rights reserved.
//

import Foundation

struct Movie : Codable{
    let objectId : String
    let category : String
    let imdbId : String
    let director : String
    let name : String
    let poster : String
    let createdAt : String
    let updatedAt : String
}
