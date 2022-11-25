//
//  Movie.swift
//  ituneMovie
//
//  Created by Giap on 24/11/2022.
//

import Foundation

//struct Movie {
//    let trackName: String
//    let artworkUrl60: String
//    let trackPrice: Double
//    let primaryGenreName: String
//    
//    init(trackName: String, artworkUrl60: String, trackPrice: Double, primaryGenreName: String) {
//        self.trackName = trackName
//        self.artworkUrl60 = artworkUrl60
//        self.trackPrice = trackPrice
//        self.primaryGenreName = primaryGenreName
//    }
//}

struct Movie : Codable {
    let trackId : Int?
    let trackName : String?
    let artworkUrl60 : String?
    let trackPrice : Double?
    let primaryGenreName : String?
    let shortDescription : String?
    
    enum CodingKeys: String, CodingKey {
        case trackId = "trackId"
        case trackName = "trackName"
        case artworkUrl60 = "artworkUrl60"
        case trackPrice = "trackPrice"
        case primaryGenreName = "primaryGenreName"
        case shortDescription = "shortDescription"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
        trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
        trackPrice = try values.decodeIfPresent(Double.self, forKey: .trackPrice)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
        shortDescription = try values.decodeIfPresent(String.self, forKey: .shortDescription)
    }
    
}