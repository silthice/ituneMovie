//
//  FavouriteMovieListViewController.swift
//  ituneMovie
//
//  Created by Giap on 13/12/2022.
//

import UIKit
import SwiftRichString

class FavouriteMovieListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var safeAreaView: UIView!
   
    @IBAction func closeButtonDidTap(_ sender: Any) {
        self.delegate?.refresh()
        self.dismiss(animated: true)
    }
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var favMovieCollectionView: UICollectionView!
    @IBOutlet weak var favMovieCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var emptyViewContainer: UIView!
    // MARK: - Navigation
    
    // MARK: - Constant
    
    // MARK: - Var
    var favMovies: [Movie] = []
    var delegate: movieViewControllerDelegate?
    
    // MARK: - MVVM
    let movieDetailController = MovieDetailViewController()
    
    // MARK: - Constant
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
        title = "Favourites"
        
        guard let data = UserDefaults.standard.data(forKey: "FavMovieArray"),
        let favMovieArray = try? JSONDecoder().decode([Movie].self, from: data) else { return }
        favMovies = favMovieArray
        
        let image = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate)
        closeButton.setImage(image, for: .normal)
        let closeButtonColor: UIColor = .dynamicColor(light: UIColor(hexString: "#FFFFFF"), dark: UIColor(hexString: "#FFFFFF"))
        closeButton.tintColor = closeButtonColor
        
        favMovieCollectionView.dataSource = self
        favMovieCollectionView.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        
        if favMovies.count > 1 {
            emptyViewContainer.isHidden = true
        } else {
            emptyViewContainer.isHidden = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

extension FavouriteMovieListViewController {
    func setupUI() {
        
    }
}

extension FavouriteMovieListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.setupCell(with: favMovies[indexPath.item])
        return cell
    }
}

extension FavouriteMovieListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieDetailController.movieDetail = favMovies[indexPath.item]
        self.navigationController?.pushViewController(movieDetailController, animated: true)
    }
}

