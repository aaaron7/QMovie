//
//  MovieListViewController.swift
//  QMovie
//
//  Created by aaron on 2018/3/11.
//  Copyright © 2018年 aaron. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, MovieListViewDataSource{
    
    var registerMovies:[RegisterMovie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
        
        let service = MovieListService()
        service.getTodayRegisterMoviesInfo { (registeredMovies, error) in
            service.getMovieDetailInfo(imdbIds: registeredMovies.map({$0.imdbId}), completion: { (movies, error) in
                let imdbMovieMap = movies.reduce([:], { (accmu : [String:Movie], m) -> [String:Movie] in
                    var newAcc = accmu
                    newAcc[m.imdbId] = m
                    return newAcc
                })
                
                self.registerMovies = registeredMovies
            
                for i in 0..<self.registerMovies.count{
                    var rm = self.registerMovies[i]
                    rm.MovieInfo = imdbMovieMap[rm.imdbId]
                    self.registerMovies[i] = rm
                }
                
                DispatchQueue.main.async {
                    self.movieListView.reloadData()
                }
                
                print(movies)
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(screenListView)
        view.addSubview(movieListView)
        
        movieListView.snp.makeConstraints { (cm) in
            cm.height.equalTo(240)
            cm.top.width.equalTo(self.view)
        }
    }

    lazy var screenListView : ScreenListView = {
        let view = ScreenListView()
        return view
    }()
    
    lazy var movieDetailView : MovieDetailView = {
        let view = MovieDetailView()
        return view
    }()
    
    lazy var movieListView : MovieListView = {
        let view = MovieListView()
        view.backgroundColor = UIColor.blue
        view.dataSource = self
        return view
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension MovieListViewController{
    func getMovies() -> [Movie] {
        return self.registerMovies.reduce([], { (accm , rm) -> [Movie] in
            let movieExists = accm.filter({$0.imdbId == rm.imdbId}).count > 0
            var newAcc = accm
            if !movieExists{
                newAcc.append(rm.MovieInfo!)
            }
            
            return newAcc
        })
    }
}
