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
    @IBOutlet weak var movieCollectionViewFlowLayout: UICollectionViewFlowLayout!
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
        setupUI()
        viewModel.delegate = self
        viewModel.getMovieList(url: url)
        movieCollectionView.dataSource  = self
        movieCollectionView.delegate = self
        movieCollectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionReusableView.identifier)
    }
    
    

}

// MARK: - Extends CollectionViewDataSource protocol
extension MovieViewController: UICollectionViewDataSource {
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.setupCell(with: movies[indexPath.item])
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCellReuseIdentifier", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MovieCollectionReusableView", for: indexPath) as! MovieCollectionReusableView
        header.setupHeader()
        return header
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionReusableView.identifier, for: indexPath)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.size.width, height: 80)
//    }
}

// MARK: - Extends CollectionViewDelegate protocol
extension MovieViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = movieCollectionView.cellForItem(at: indexPath)
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
        self.movies = movies
        self.movieCollectionView.reloadData()
    }
    
    func showErrorAlert(errorMessage: String?) {
        //showerrror
    }
    
    
}


// MARK: - SetupUI
extension MovieViewController {
    func setupUI(){
        setupMovieCollectionFlowLayout()
        
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func setupMovieCollectionFlowLayout(){
        let cellWidth = Int(view.frame.size.width) - 20
        let cellHeight = 100
        movieCollectionViewFlowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
    }
}
