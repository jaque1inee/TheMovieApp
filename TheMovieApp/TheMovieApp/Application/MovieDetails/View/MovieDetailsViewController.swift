//
//  MovieDetailsViewController.swift
//  TheMovieApp
//
//  Created by Jaqueline Oliveira on 12/03/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleMovieDetails: UILabel!
    @IBOutlet weak var imageMovieDetails: UIImageView!
    @IBOutlet weak var genreDetails: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var lancamentoMovie: UILabel!
    @IBOutlet weak var idiomaMovie: UILabel!
    @IBOutlet weak var notaMovie: UILabel!
    
    var movie: Movie?
    var details: MovieDetails?
    var presenter: MovieDetailsPresenter = MovieDetailsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        presenter.delegate = self
        presenter.getMovieDetails(idMovie: movie?.id ?? 0)

        titleMovieDetails.text = movie?.original_title
        imageMovieDetails.downloaded(from: "https://image.tmdb.org/t/p/original/\(movie?.poster_path ?? "")" )
        descriptionMovie.text = movie?.overview
    }
    
    @IBAction func didBackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MovieDetailsViewController: MovieDetailsPresenterDelegate {
    func didSuccessMovieDetails(results: MovieDetails) {
        //8 tratar resultados obtidos
        self.details = results
        var genreString = ""
        for genre in details?.genres ?? []{
            genreString += "\(genre.name ?? "") "
        }
        genreDetails.text = genreString
        notaMovie.text = "\(movie?.vote_average ?? 0 )"
        lancamentoMovie.text = "Lançamento: \(movie?.release_date ?? "")"
        idiomaMovie.text = "Idioma: \(movie?.original_language ?? "")"
    }
    
    func didFailureMovieDetails(error: String) {
        print(error)
    }
}
