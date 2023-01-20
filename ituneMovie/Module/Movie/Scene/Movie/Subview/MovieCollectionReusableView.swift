//
//  MovieCollectionReusableView.swift
//  ituneMovie
//
//  Created by Giap on 25/11/2022.
//

import UIKit

class MovieCollectionReusableView: UICollectionReusableView {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    func setupHeader(){
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM HH:mm:ss"
        let dateToSet = dateFormatter.string(from: date)
        
        if let prevDate = UserDefaults.standard.string(forKey: "prevDate") {
            dateLabel.text = prevDate
            UserDefaults.standard.set(dateToSet, forKey: "prevDate")
        } else{
            dateLabel.text = dateToSet
        }
    }
}
