//
//  MovieViewController.swift
//  ituneMovie
//
//  Created by Giap on 24/11/2022.
//

import UIKit

protocol MovieDelegate {
    func hehe()
}

class MovieViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var safeAreaView: UIView!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    @IBOutlet weak var movieCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    @IBAction func drawerDidTap(_ sender: Any) {
        let drawerMenu = DrawerMenuViewController()
        drawerMenu.delegate = self
        present(drawerMenu, animated: true)
    }
    // MARK: - Navigation
    
    // MARK: - Constant
    
    // MARK: - Var
    var movies: [Movie] = []
    var favMovies: [Movie] = []
    
    
    // MARK: - MVVM
    let viewModel = MovieViewModel()
    let movieDetailController = MovieDetailViewController()
    
    // MARK: - Constant
    let url: String = "https://itunes.apple.com/search?term=star&country=au&media=movie&;all"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
        viewModel.delegate = self
        viewModel.getMovieList(url: url)
        movieCollectionView.dataSource  = self
        movieCollectionView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MovieCollectionReusableView", for: indexPath) as! MovieCollectionReusableView
        header.setupHeader()
        return header
    }
}

// MARK: - Extends CollectionViewDelegate protocol
extension MovieViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieDetailController.movieDetail = movies[indexPath.item]
        self.navigationController?.pushViewController(movieDetailController, animated: true)
    }
}

// MARK: - MVVM
protocol movieViewControllerDelegate {
    func updateMovieCollection(movies: [Movie])
    func showErrorAlert(errorMessage: String?)
    func testNav(selectedMovie: Movie)
    func refresh()
}

extension MovieViewController: movieViewControllerDelegate {
    func updateMovieCollection(movies: [Movie]) {
        self.movies = movies
        self.movieCollectionView.reloadData()
    }
    
    func showErrorAlert(errorMessage: String?) {
        //showerrror
    }
    
    func testNav(selectedMovie: Movie) {
        movieDetailController.movieDetail = selectedMovie
        self.navigationController?.pushViewController(movieDetailController, animated: true)
    }
    
    func refresh() {
        self.movieCollectionView.reloadData()
    }
    
}


// MARK: - SetupUI
extension MovieViewController {
    func setupUI(){
        title = "iTunes Movie List"
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
