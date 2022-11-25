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
        
        
        
        favToggle()
        setupButton()
        
    }

}
extension MovieCollectionViewCell {
    func favToggle(){
        let favIdArray = defaults.array(forKey: "FavIdArr") as? [Int] ?? [Int]()
        var fillColor: UIColor
        if favIdArray.contains(movie!.trackId){
            fillColor = .red
        } else {
            fillColor = .systemBackground
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
//        print(movie)
        print([movie?.trackId])
        
//        if let appDomain = Bundle.main.bundleIdentifier {
//        UserDefaults.standard.removePersistentDomain(forName: appDomain)
//         }
  
        var favIdArray = defaults.array(forKey: "FavIdArr") as? [Int] ?? [Int]()
        print("favIdArray", favIdArray)
        if favIdArray.count > 0 {
            //if list has favorite movie
            if favIdArray.contains(movie!.trackId){
                print("found this item")
                if let index = favIdArray.firstIndex(of: movie!.trackId){
                    favIdArray.remove(at: index)
                    defaults.set(favIdArray, forKey: "FavIdArr")
                }
            } else {
                //append current movie to list
                favIdArray.append(movie!.trackId)
                defaults.set(favIdArray, forKey: "FavIdArr")
//                defaults.set(temp, forKey: "FavIdArr")
            }
        } else {
            //if no favorite movie in list, add to list
            defaults.set([movie?.trackId], forKey: "FavIdArr")
        }
        favToggle()

//        print(favIdArray)
//
//        if favIdArray.contains(movie!.trackId){
//
//        } else {
//
//        }
//        if let favIdArray = defaults.array(forKey: "FavIdArr") {
//
//            if favIdArray.contains(975080816){
////            if favIdArray.contains(where: movie?.trackId){
//                print("found")
//
//            }
//           print(favIdArray)
//
//            //            let arr: [Int] = []
//            //            arr.app
//            //            print(favIdArray)
//            //
//            //            if let isFavorited = favIdArray.contains(movie?.trackId){
//            //                favIdArray.remove
//            //            }
//        } else {
//            defaults.set([movie?.trackId], forKey: "FavIdArr")
//        }
////
//        let fsavedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
//        print("bfore", fsavedArray)
//
//        let array = ["Hello", "World"]
//        defaults.set(array, forKey: "SavedArray")
//
//        let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
//        print("after", savedArray)

    }
}
