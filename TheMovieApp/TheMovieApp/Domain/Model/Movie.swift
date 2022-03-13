//
//  Movie.swift
//  TheMovieApp
//
//  Created by Jaqueline Oliveira on 11/03/22.
//

import Foundation

struct MovieResult : Decodable {
    var results: [Movie] = []
    var total_pages: Int?
}

struct Movie : Decodable {
    var id : Int?
    var original_language : String?
    var overview : String?
    var backdrop_path : String?
    var original_title : String?
    var poster_path: String?
    var genre_ids: [Int]?
    var release_date: String?
    var vote_average: Float?
}
