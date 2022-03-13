//
//  HomePresenter.swift
//  TheMovieApp
//
//  Created by Jaqueline Oliveira on 11/03/22.
//

import Foundation
import Alamofire
//3
protocol HomePresenterDelegate: AnyObject {
    func didSuccessMovieList(results: MovieResult)
    func didFailureMovieList(error: String)
    func didSuccessGenreList(results: GenreMovie)
    func didFailureGenreList(error: String)
    func didRequestCompleted()
}

class HomePresenter {
    weak var delegate: HomePresenterDelegate?
    var page = 1
    let group = DispatchGroup()
   
    func getMovieList() {
        
        group.enter()
        
        AF.request("https://api.themoviedb.org/3/movie/now_playing?api_key=f321a808e68611f41312aa8408531476&page=\(page)", method: .get).response { [self] response in
            switch response.result {
            case .success:
                do {
                    let results: MovieResult = try JSONDecoder().decode(MovieResult.self, from: response.data ?? Data())
                    self.group.leave()
                    self.delegate?.didSuccessMovieList(results: results)
                    
                } catch {
                    self.delegate?.didFailureMovieList(error: "Algo deu errado!")
                    self.group.leave()
                }
            case .failure(_):

                self.delegate?.didFailureMovieList(error: "Algo deu errado!")
                self.group.leave()
            }
        }
        getGenreList()
        group.notify(queue: DispatchQueue.main) {
            self.delegate?.didRequestCompleted()
        }
    }
    
    func getGenreList () {
        AF.request("https://api.themoviedb.org/3/genre/movie/list?api_key=f321a808e68611f41312aa8408531476", method: .get) .response
        { response in
            switch response.result {
            case .success:
                do {
                    let resultsgenres : GenreMovie = try JSONDecoder().decode(GenreMovie.self, from: response.data ?? Data())
                    self.delegate?.didSuccessGenreList(results: resultsgenres)
                    
                } catch {
                    self.delegate?.didFailureGenreList(error: "Algo deu errado!")
                }
            case .failure(_):
                self.delegate?.didFailureGenreList(error: "Algo deu errado")
            }
        }
    }
}
