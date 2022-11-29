//
//  MovieDetailViewController.swift
//  ituneMovie
//
//  Created by Giap on 29/11/2022.
//

import UIKit

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
//        print("passed", movieDetail)
        setupRightBarItem()
        setupMovieDetails()
    }
    
    

}

extension MovieDetailViewController {
    func setupRightBarItem() {
        var fillColor: UIColor
        fillColor = .systemBackground
        
        let favButton = UIImage(systemName: "heart.fill")?.withTintColor(fillColor, renderingMode: .alwaysOriginal)
        self.navigationItem.rightBarButtonItem =
        UIBarButtonItem(image: favButton, style: .plain, target: self, action: #selector(favDidTap))
        
    }
    
    @objc func favDidTap() {
        print("hello")
        
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
        let data = try? Data(contentsOf: url!)
        if let data = data {
            movieImageView.image = UIImage(data: data)
        }
        
        // substr get date instead date format
        var releaseDate = movieDetail?.releaseDate
        releaseDateValueLabel.text = String(releaseDate!.prefix(10))
    }
}
