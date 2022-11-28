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

struct Movie : Codable, Equatable {
    let trackId : Int
//    let trackId : Int?
    let trackName : String?
    let artworkUrl60 : String?
    let artworkUrl100 : String?
    let trackPrice : Double?
    let primaryGenreName : String?
    let shortDescription : String?
    let longDescription : String?
    
    let wrapperType : String?
    let kind : String?
    let collectionId : Int?
    let artistName : String?
    let collectionName : String?
    let collectionCensoredName : String?
    let trackCensoredName : String?
    let collectionArtistId : Int?
    let collectionArtistViewUrl : String?
    let collectionViewUrl : String?
    let trackViewUrl : String?
    let previewUrl : String?
    let artworkUrl30 : String?
    let collectionPrice : Double?
    let trackRentalPrice : Double?
    let collectionHdPrice : Double?
    let trackHdPrice : Double?
    let trackHdRentalPrice : Double?
    let releaseDate : String?
    let collectionExplicitness : String?
    let trackExplicitness : String?
    let discCount : Int?
    let discNumber : Int?
    let trackCount : Int?
    let trackNumber : Int?
    let trackTimeMillis : Int?
    let country : String?
    let currency : String?
    let contentAdvisoryRating : String?
    let hasITunesExtras : Bool?
    
    enum CodingKeys: String, CodingKey {
        case trackId = "trackId"
        case trackName = "trackName"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case trackPrice = "trackPrice"
        case primaryGenreName = "primaryGenreName"
        case shortDescription = "shortDescription"
        case longDescription = "longDescription"
        
        case wrapperType = "wrapperType"
        case kind = "kind"
        case collectionId = "collectionId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case collectionCensoredName = "collectionCensoredName"
        case trackCensoredName = "trackCensoredName"
        case collectionArtistId = "collectionArtistId"
        case collectionArtistViewUrl = "collectionArtistViewUrl"
        case collectionViewUrl = "collectionViewUrl"
        case trackViewUrl = "trackViewUrl"
        case previewUrl = "previewUrl"
        case artworkUrl30 = "artworkUrl30"
        case collectionPrice = "collectionPrice"
        case trackRentalPrice = "trackRentalPrice"
        case collectionHdPrice = "collectionHdPrice"
        case trackHdPrice = "trackHdPrice"
        case trackHdRentalPrice = "trackHdRentalPrice"
        case releaseDate = "releaseDate"
        case collectionExplicitness = "collectionExplicitness"
        case trackExplicitness = "trackExplicitness"
        case discCount = "discCount"
        case discNumber = "discNumber"
        case trackCount = "trackCount"
        case trackNumber = "trackNumber"
        case trackTimeMillis = "trackTimeMillis"
        case country = "country"
        case currency = "currency"
        case contentAdvisoryRating = "contentAdvisoryRating"
        case hasITunesExtras = "hasITunesExtras"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
        trackId = try values.decode(Int.self, forKey: .trackId)
        trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        trackPrice = try values.decodeIfPresent(Double.self, forKey: .trackPrice)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
        shortDescription = try values.decodeIfPresent(String.self, forKey: .shortDescription)
        longDescription = try values.decodeIfPresent(String.self, forKey: .longDescription)
        
        wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
        collectionArtistId = try values.decodeIfPresent(Int.self, forKey: .collectionArtistId)
        collectionArtistViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionArtistViewUrl)
        collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
        trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl)
        previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
        artworkUrl30 = try values.decodeIfPresent(String.self, forKey: .artworkUrl30)
        collectionPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice)
        trackRentalPrice = try values.decodeIfPresent(Double.self, forKey: .trackRentalPrice)
        collectionHdPrice = try values.decodeIfPresent(Double.self, forKey: .collectionHdPrice)
        trackHdPrice = try values.decodeIfPresent(Double.self, forKey: .trackHdPrice)
        trackHdRentalPrice = try values.decodeIfPresent(Double.self, forKey: .trackHdRentalPrice)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
        trackExplicitness = try values.decodeIfPresent(String.self, forKey: .trackExplicitness)
        discCount = try values.decodeIfPresent(Int.self, forKey: .discCount)
        discNumber = try values.decodeIfPresent(Int.self, forKey: .discNumber)
        trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
        trackNumber = try values.decodeIfPresent(Int.self, forKey: .trackNumber)
        trackTimeMillis = try values.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        contentAdvisoryRating = try values.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
        hasITunesExtras = try values.decodeIfPresent(Bool.self, forKey: .hasITunesExtras)
    }
    
}
