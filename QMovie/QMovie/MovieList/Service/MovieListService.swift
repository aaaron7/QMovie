//
//  MovieListService.swift
//  QMovie
//
//  Created by aaron on 2018/3/11.
//  Copyright © 2018年 aaron. All rights reserved.
//

import Foundation
import Networking
import SwiftyJSON

extension Dictionary{
    func jsonData() -> Data? {
        let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [])
        guard jsonData != nil else {return nil}
        return jsonData
    }
}

class MovieListService{
    
    let baseUrl = "http://localhost:3000"
    func getTodayRegisterMoviesInfo(completion:@escaping ([RegisterMovie], NSError?)-> Void){
        let queryDate = "2018-03-12";//dateString(from: Date())
        Networking(baseURL: baseUrl).post("/movie/register_movie_by_date", parameterType: .formURLEncoded, parameters: ["queryDate": queryDate]) { (jr) in
            switch jr{
            case .success(let response):
                let json = response.dictionaryBody
                let results = json["data"] as? [[String:Any]]
                var movies:[RegisterMovie] = []
                if let r = results{
                    movies = r.map({ (x) -> RegisterMovie? in
                        let decoder = JSONDecoder()
                        let data = x.jsonData()
                        guard let _ = data else{
                            return nil
                        }
                        guard let obj = try? decoder.decode(RegisterMovie.self, from: data!) else {
                            return nil
                        }
                        return obj

                    }).flatMap {$0}
                }
                
                completion(movies, nil)
                break
            case .failure(let err):
                completion([], err.error)
                break
            }
        }
    }
    
    func getMovieDetailInfo(imdbIds : [String], completion:@escaping ([Movie], NSError?)->Void){
        let idString = imdbIds.joined(separator: ",")
        Networking(baseURL:baseUrl).post("/movie/get_movie_detail_info", parameterType: .formURLEncoded, parameters: ["imdbIds":idString]) { (jr) in
            switch jr{
            case .success(let response):
                let json = response.dictionaryBody
                let retCode = json["ret"] as? Int
                guard let _ = retCode, retCode == 0 else{
                    assert(false)
                }
                
                let data = json["data"] as! [[String:Any]]
                let movies = data.map({ (d) -> Movie? in
                    let decoder = JSONDecoder()
                    let data = d.jsonData()
                    guard let _ = data else{
                        return nil
                    }
                    guard let obj = try? decoder.decode(Movie.self, from: data!) else{
                        return nil
                    }
                    return obj
                }).flatMap{$0}
                completion(movies, nil)
                break
            case .failure(let err):
                completion([],err.error)
                break
            }
        }
    }
}
