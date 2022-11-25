//
//  MovieViewController.swift
//  ituneMovie
//
//  Created by Giap on 24/11/2022.
//

import UIKit

class MovieViewController: UIViewController {
    
    
  

    // MARK: - IBOutlets
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    // MARK: - Navigation
    // MARK: - Constant
    // MARK: - Var
    var movies: [Movie] = []
    
    
    // MARK: - MVVM
    let viewModel = MovieViewModel()
    
    // MARK: - Constant
    let url: String = "https://itunes.apple.com/search?term=star&country=au&media=movie&;all"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getMovieList(url: url)
        movieCollectionView.dataSource  = self
        movieCollectionView.delegate = self
    }
    
    

}

// MARK: - Extends CollectionViewDataSource protocol
extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCellReuseIdentifier", for: indexPath)
        return cell
    }
}

// MARK: - Extends CollectionViewDelegate protocol
extension MovieViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = movieCollectionView.cellForItem(at: indexPath)
        print("item tapped", cell)
        print("item tapped", indexPath)
        print("item tapped", indexPath.item)
//        print("item tapped", movies[indexPath])
        print("item tapped", movies[indexPath.item])
//        viewModel.movieDidTap(movie: String(indexPath.item))
//        viewModel.movieDidTap(movie: cell)
    }
}


// MARK: - MVVM
protocol movieViewControllerDelegate {
    func updateMovieCollection(movies: [Movie])
    func showErrorAlert(errorMessage: String?)
}

extension MovieViewController: movieViewControllerDelegate {
    func updateMovieCollection(movies: [Movie]) {
        print("movies passed back", movies)
        self.movies = movies
        self.movieCollectionView.reloadData()
    }
    
    func showErrorAlert(errorMessage: String?) {
        //showerrror
    }
    
    
}
