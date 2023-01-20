//
//  MovieDetailViewController.swift
//  ituneMovie
//
//  Created by Giap on 29/11/2022.
//

import UIKit
import Kingfisher



class MovieDetailViewController: UIViewController {
    
    var movieDetail: Movie?
    
    //MARK: IBOutlet
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var genreValueLabel: UILabel!
    @IBOutlet weak var releaseDateValueLabel: UILabel!
    @IBOutlet weak var artistValueLabel: UILabel!
    @IBOutlet weak var priceValueLabel: UILabel!
    @IBOutlet weak var descriptionValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
        setupRightBarItem()
        setupMovieDetails()
    }
}

extension MovieDetailViewController {
    
    func setupNavigationBar(){
        navigationController?.navigationBar.backgroundColor = .darkGray
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func setupRightBarItem() {
        favToggle()
    }
    
    func favToggle(){
        
        guard
            let data = UserDefaults.standard.data(forKey: "FavMovieArray"),
            var favMovieArray = try? JSONDecoder().decode([Movie].self, from: data) else { return }
        
        var fillColor: UIColor
        fillColor = .white
        
        if favMovieArray.contains(where: {$0.trackId == movieDetail?.trackId}){
            fillColor = .red
        }
        
        let favButton = UIImage(systemName: "heart.fill")?.withTintColor(fillColor, renderingMode: .alwaysOriginal)
        self.navigationItem.rightBarButtonItem =
        UIBarButtonItem(image: favButton, style: .plain, target: self, action: #selector(favDidTap))
        
    }
    
    @objc func favDidTap() {
        guard
           let data = UserDefaults.standard.data(forKey: "FavMovieArray"),
           var favMovieArray = try? JSONDecoder().decode([Movie].self, from: data) else {
            save(movies: [movieDetail!])
            return
        }
        
        if favMovieArray.count > 0 {
            
            if favMovieArray.contains(where: {$0.trackId == movieDetail?.trackId}){
                if let index = favMovieArray.firstIndex(of: movieDetail!){
                    favMovieArray.remove(at: index)
                    save(movies: favMovieArray)
                }
            } else{
                favMovieArray.append(movieDetail!)
                save(movies: favMovieArray)
            }
            
        } else {
            save(movies: [movieDetail!])
        }
        
        favToggle()
        
    }
    
    func setupMovieDetails(){
        movieNameLabel.text = movieDetail?.trackName
        genreValueLabel.text = movieDetail?.primaryGenreName
        artistValueLabel.text = movieDetail?.artistName
        descriptionValueLabel.text = movieDetail?.longDescription
        priceValueLabel.text = "$" + String(format: "%.2f", movieDetail!.trackPrice!)
        
        //movie image
        movieImageView.contentMode = .scaleAspectFill
        let url = URL(string: movieDetail?.artworkUrl100 ?? "")
        movieImageView.kf.setImage(with: url, placeholder: bannerPlaceHolder)
//        let data = try? Data(contentsOf: url!)
//        if let data = data {
//            movieImageView.image = UIImage(data: data)
//        }
        
        // substr get date instead date format
        var releaseDate = movieDetail?.releaseDate
        releaseDateValueLabel.text = String(releaseDate!.prefix(10))
    }
}


extension MovieDetailViewController {
    func save(movies: [Movie]) {
        if let encodedData = try? JSONEncoder().encode(movies){
            UserDefaults.standard.set(encodedData, forKey: "FavMovieArray")
        }
    }
}
