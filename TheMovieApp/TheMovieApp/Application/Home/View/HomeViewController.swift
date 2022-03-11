//
//  HomeViewController.swift
//  TheMovieApp
//
//  Created by Joao Marcus Dionisio Araujo on 11/03/22.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://api.themoviedb.org/3/movie/76341/lists?api_key=f321a808e68611f41312aa8408531476").response { response in
            debugPrint(response)
        }
    }
    
}
