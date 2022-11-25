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

//MARK: MVVM
protocol movieViewModelDelegate {
    func movieDidTap(movie: String)
}

extension MovieViewModel: movieViewModelDelegate {
    func movieDidTap(movie: String) {
        print("passed value", movie)
    }
}

//extension MovieViewModel{
//    func getMovieList(url: String) {
//        print("calling url", url)
//        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
//            guard let data = data, error == nil else {
//                print("url call failed")
//                return
//            }
//            var result: Response?
//            do {
//                result = try JSONDecoder().decode(Response.self, from: data)
//            } catch {
//                print("JSON CONVERsion failed")
//            }
//
//            print("result", result)
//        })
//        task.resume()
//    }
//}

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

extension URLSession {

    enum CustomError: Error {
        case invalidURL
        case invalidData
    }
    func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = url else{
            completion(.failure(CustomError.invalidURL))
            return
        }

        let task = dataTask(with: url) { data, _, error in
            guard let data = data else{
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }

            do{
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }

        }

        task.resume()
    }
}

//inside model?
//struct Response : Codable {
//    let resultCount : Int?
//    let results : [Movie]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case resultCount = "resultCount"
//        case results = "results"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
//        results = try values.decodeIfPresent([Movie].self, forKey: .results)
//    }
//
//}

//struct Movies : Codable {
//    let trackId : Int?
//    let trackName : String?
//    let artworkUrl60 : String?
//    let trackPrice : Double?
//    let primaryGenreName : String?
//    let shortDescription : String?
//    
//    enum CodingKeys: String, CodingKey {
//        case trackId = "trackId"
//        case trackName = "trackName"
//        case artworkUrl60 = "artworkUrl60"
//        case trackPrice = "trackPrice"
//        case primaryGenreName = "primaryGenreName"
//        case shortDescription = "shortDescription"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
//        trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
//        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
//        trackPrice = try values.decodeIfPresent(Double.self, forKey: .trackPrice)
//        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
//        shortDescription = try values.decodeIfPresent(String.self, forKey: .shortDescription)
//    }
//    
//}
