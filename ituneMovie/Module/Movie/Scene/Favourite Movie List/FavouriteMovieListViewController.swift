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
        print("close pressed")
        self.dismiss(animated: true)
    }
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var favMovieCollectionView: UICollectionView!
    @IBOutlet weak var favMovieCollectionViewFlowLayout: UICollectionViewFlowLayout!
    // MARK: - Navigation
    
    // MARK: - Constant
    
    // MARK: - Var
    var favMovies: [Movie] = []
    
    
    // MARK: - MVVM
//    let viewModel = MovieViewModel()
    let movieDetailController = MovieDetailViewController()
    
    
    
    // MARK: - Constant
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
        
        guard let data = UserDefaults.standard.data(forKey: "FavMovieArray"),
        var favMovieArray = try? JSONDecoder().decode([Movie].self, from: data) else { return }
        favMovies = favMovieArray
        
        
        print("safeareaview", safeAreaView)
        print("favMovieCollectionView", favMovieCollectionView)
        title = "TEST 123"
        
        
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate)
        closeButton.setImage(image, for: .normal)
//        let closeButtonColor: UIColor = .white
//        let closeButtonColor: UIColor = .dynamicColor(light: UIColor.black, dark: UIColor.white)

        
        let closeButtonColor: UIColor = .dynamicColor(light: UIColor(hexString: "#000000"), dark: UIColor(hexString: "#FFFFFF"))
                closeButton.tintColor = closeButtonColor
        
        favMovieCollectionView.dataSource = self
        favMovieCollectionView.delegate = self
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
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
        let cell = favMovieCollectionView.cellForItem(at: indexPath)
        movieDetailController.movieDetail = favMovies[indexPath.item]
        self.navigationController?.pushViewController(movieDetailController, animated: true)
    }
}

