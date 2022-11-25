//
//  MovieCollectionViewCell.swift
//  ituneMovie
//
//  Created by Giap on 25/11/2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var trackNameValueLabel: UILabel!
    @IBOutlet weak var genreValueLabel: UILabel!
    @IBOutlet weak var priceValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(with movie: Movie){
        trackNameValueLabel.text = movie.trackName
//        movieImageView.image = movie.artworkUrl60
        priceValueLabel.text = "$" + String(format: "%.2f", movie.trackPrice!)
        genreValueLabel.text = movie.primaryGenreName
        
        movieImageView.contentMode = .scaleAspectFill
        let url = URL(string: movie.artworkUrl100 ?? "")
        let data = try? Data(contentsOf: url!)
        if let data = data {
            movieImageView.image = UIImage(data: data)
        }
    }

}
