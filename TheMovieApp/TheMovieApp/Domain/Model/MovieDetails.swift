//
//  MovieDetails.swift
//  TheMovieApp
//
//  Created by Jaqueline Oliveira on 12/03/22.
//

import Foundation

struct MovieDetails : Decodable {
    var original_language : String?
    var overview : String?
    var backdrop_path : String?
    var original_title : String?
    var poster_path: String?
    var genres: [GenreDetails]?
}

struct GenreDetails: Decodable {
    var id: Int?
    var name: String?
}
