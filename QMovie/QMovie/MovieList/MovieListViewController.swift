//
//  MovieListViewController.swift
//  QMovie
//
//  Created by aaron on 2018/3/11.
//  Copyright © 2018年 aaron. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
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
            cm.height.equalTo(200)
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
