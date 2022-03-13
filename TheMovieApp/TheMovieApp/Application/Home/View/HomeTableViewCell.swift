//
//  HomeTableViewCell.swift
//  TheMovieApp
//
//  Created by Jaqueline Oliveira on 11/03/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var genreMovie: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    func setup(movie: Movie, genres: String ) {
        titleMovie.text = movie.original_title
        imageMovie.downloaded(from: "https://image.tmdb.org/t/p/original/\(movie.poster_path ?? "")" )
        releaseDate.text = "\(movie.release_date ?? "")"
        voteAverage.text = "\(movie.vote_average ?? 0)"
        genreMovie.text = genres
    }
}
