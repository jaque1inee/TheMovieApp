//
//  HomeViewController.swift
//  TheMovieApp
//
//  Created by Jaqueline Oliveira on 11/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var fieldSearch: UITextField!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var imageUser: UIImageView!
    var movies = MovieResult()
    var presenter: HomePresenter = HomePresenter()
    var genres: GenreMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        imageUser.layer.cornerRadius = imageUser.frame.height/2
        presenter.delegate = self
        loader.startAnimating()
        presenter.getMovieList()
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let movie = self.movies.results[indexPath.row]
        var genreString = ""
        
        if let genresIds = movie.genre_ids {
            for genre in genres?.genres ?? [] {
                if(genresIds.contains(genre.id ?? 0)) {
                    genreString += "\(genre.name ?? "") "
                }
            }
        }
        cell.setup(movie: movie, genres: genreString)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if movies.total_pages ?? 0 > presenter.page {
            if indexPath.item == movies.results.count - 1 {
                presenter.page += 1
                presenter.getMovieList()
                loader.startAnimating()
            }
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
        
        let vc = storyboard.instantiateViewController(
            withIdentifier: "MovieDetails") as! MovieDetailsViewController
        vc.movie = movies.results[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
        }
    }
    
extension HomeViewController: HomePresenterDelegate {
    
    func didSuccessMovieList(results: MovieResult) {
        if(presenter.page > 1) {
            movies.results += results.results
            return
        }
        self.movies = results
    }
    func didFailureMovieList(error: String) {
        loader.isHidden = true
        print(error)
    }
    func didSuccessGenreList(results: GenreMovie) {
        self.genres = results
    }
    
    func didFailureGenreList(error: String) {
        print("error")
    }
    
    func didRequestCompleted() {
        self.movieTableView.reloadData()
        loader.stopAnimating()
    }
}
