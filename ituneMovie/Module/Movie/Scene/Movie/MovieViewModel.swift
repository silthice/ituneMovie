//
//  MovieViewModel.swift
//  ituneMovie
//
//  Created by Giap on 24/11/2022.
//

import Foundation

class MovieViewModel {
    
    //MARK: Input
    
    //MARK: Output
    
    //MARK: Dependency
    var delegate: movieViewControllerDelegate?
    
    //MARK: Constant
    
    //MARK: Var
    var movies: [Movie] = []
    
    //MARK: Init
    
    //MARK: transform
}

extension MovieViewModel {
    func getMovieList(url: String) {
        let urlString = URL(string: url)
        URLSession.shared.request(url: urlString, expecting: MovieListResponse.self, completion: {
            [weak self] result in
            switch result {
            case .success(let res):
                guard let movies = res.results else {
                    return
                }
                DispatchQueue.main.async {
                    self?.delegate?.updateMovieCollection(movies: movies)
                }
            case .failure(let error):
                print("error here", error)
            }
        })
    }
}
