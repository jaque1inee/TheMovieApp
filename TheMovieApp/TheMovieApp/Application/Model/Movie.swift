//
//  Movie.swift
//  TheMovieApp
//
//  Created by Joao Marcus Dionisio Araujo on 11/03/22.
//

import Foundation

struct Movie : Decodable {
    let id : Int
    let original_language : String
    let overview : String
    let backdrop_path : String?
    let original_title : String?
    
    
    
}

//         "backdrop_path":"/5P8SmMzSNYikXpxil6BYzJ16611.jpg",
//         "genre_ids":[
//            80,
//            9648,
//            53
//         ],
//         "id":414906,
//         "original_language":"en",
//         "original_title":"The Batman",
//         "overview":"In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
//         "popularity":3321.174,
//         "poster_path":"/74xTEgt7R36Fpooo50r9T25onhq.jpg",
//         "release_date":"2022-03-01",
//         "title":"The Batman",
//         "video":false,
//         "vote_average":8,
//         "vote_count":1388
