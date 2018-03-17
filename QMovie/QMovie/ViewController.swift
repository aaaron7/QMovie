//
//  ViewController.swift
//  QMovie
//
//  Created by aaron on 2018/3/11.
//  Copyright © 2018年 aaron. All rights reserved.
//

import UIKit
import SnapKit
import Networking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
        
        let service = MovieListService()
        service.getTodayRegisterMoviesInfo { (movies, error) in
            
        }
    }
    
    func setupViews(){
        view.addSubview(entranceButton)
        entranceButton.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(150)
            make.center.equalTo(view)
        }
        
//        let today = Date()
//
//        Networking(baseURL: "http://localhost:3000").post("/movie/register_movie_by_date", parameterType: .formURLEncoded, parameters: ["queryDate":dateString(from: today)]) { (jr : JSONResult) in
//            switch(jr){
//            case .success(let response):
//                print(response)
//                break
//            case .failure(_):
//                break
//            }
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func didButtonClicked(sender : UIButton){
        present(MovieListViewController(), animated: true) {
            
        }
    }

    lazy var entranceButton:UIButton = {
        let btn = UIButton();
        btn .setTitle("Q星影院", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(didButtonClicked(sender:)), for: .touchUpInside)
        return btn;
    }();
}

