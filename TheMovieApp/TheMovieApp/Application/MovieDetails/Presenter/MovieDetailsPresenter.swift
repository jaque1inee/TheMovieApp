//
//  MovieDetailsPresenter.swift
//  TheMovieApp
//
//  Created by Jaqueline Oliveira on 12/03/22.
//

import Foundation
import Alamofire
//3
protocol MovieDetailsPresenterDelegate: AnyObject {
    func didSuccessMovieDetails(results: MovieDetails)
    func didFailureMovieDetails(error: String)
}

//1 criar presenter
class MovieDetailsPresenter {
    
    weak var delegate: MovieDetailsPresenterDelegate?
    //2 criar  função de requisicao
    func getMovieDetails(idMovie: Int) {
        AF.request("https://api.themoviedb.org/3/movie/\(idMovie)?api_key=f321a808e68611f41312aa8408531476&page=1", method: .get).response { response in
            switch response.result {
            case .success:
                do {
                    let results: MovieDetails = try JSONDecoder().decode(MovieDetails.self, from: response.data ?? Data())
                    self.delegate?.didSuccessMovieDetails(results: results)
                    
                } catch {
                    self.delegate?.didFailureMovieDetails(error: "Algo deu errado!")
                }
            case .failure(_):
                self.delegate?.didFailureMovieDetails(error: "Algo deu errado!")
            }
        }
    }
    
}

