//
//  Genre.swift
//  TheMovieApp
//
//  Created by Jaqueline Oliveira on 13/03/22.
//

import Foundation

struct GenreMovie : Decodable {
    var genres : [Genre] = []
}

struct Genre: Decodable {
    var id: Int?
    var name: String?
}
