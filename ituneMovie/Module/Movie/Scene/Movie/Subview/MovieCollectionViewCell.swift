//
//  MovieCollectionViewCell.swift
//  ituneMovie
//
//  Created by Giap on 25/11/2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var trackNameValueLabel: UILabel!
    @IBOutlet weak var genreValueLabel: UILabel!
    @IBOutlet weak var priceValueLabel: UILabel!
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var movie: Movie?
    let defaults = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(with movie: Movie){
        self.movie = movie
        
        trackNameValueLabel.text = movie.trackName
        priceValueLabel.text = "$" + String(format: "%.2f", movie.trackPrice!)
        genreValueLabel.text = movie.primaryGenreName
        
        movieImageView.contentMode = .scaleAspectFill
        let url = URL(string: movie.artworkUrl100 ?? "")
        let data = try? Data(contentsOf: url!)
        if let data = data {
            movieImageView.image = UIImage(data: data)
        }
        
        
        cellContentView.layer.borderColor = UIColor.white.cgColor
        cellContentView.layer.borderWidth = 2
        cellContentView.layer.cornerRadius = 6
        
        
        
        favToggle()
        setupButton()
        
    }

}
extension MovieCollectionViewCell {
    func favToggle(){
        
        guard
            let data = UserDefaults.standard.data(forKey: "FavMovieArray"),
            var favMovieArray = try? JSONDecoder().decode([Movie].self, from: data) else { return }
        
        var fillColor: UIColor
        fillColor = .systemBackground
        
        if favMovieArray.contains(where: {$0.trackId == movie?.trackId}){
            fillColor = .red
        }
        
        favoriteImageView.image = UIImage(systemName: "heart.fill")?.withTintColor(fillColor, renderingMode: .alwaysOriginal)
        
    }
}

extension MovieCollectionViewCell {
    func setupButton(){
        favoriteButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(sender : UIButton) {
        print("pressed")
        
        guard
           let data = UserDefaults.standard.data(forKey: "FavMovieArray"),
           var favMovieArray = try? JSONDecoder().decode([Movie].self, from: data) else {
            save(movies: [movie!])
            return
        }
        
        if favMovieArray.count > 0 {
            
            if favMovieArray.contains(where: {$0.trackId == movie?.trackId}){
                if let index = favMovieArray.firstIndex(of: movie!){
                    favMovieArray.remove(at: index)
                    save(movies: favMovieArray)
                }
            } else{
                favMovieArray.append(movie!)
                save(movies: favMovieArray)
            }
            
        } else {
            save(movies: [movie!])
        }
        
        favToggle()
    }
}

extension MovieCollectionViewCell {
    func save(movies: [Movie]) {
        if let encodedData = try? JSONEncoder().encode(movies){
            UserDefaults.standard.set(encodedData, forKey: "FavMovieArray")
        }
    }
    
//    func load()-> {
//         guard
//            let data = UserDefaults.standard.data(forKey: "FavMovieArray"),
//            let savedItems = try? JSONDecoder().decode([Movie].self, from: <#T##Data#>) else {
//             return
//         }
//
//        self.movies = savedItems
//    }
}
