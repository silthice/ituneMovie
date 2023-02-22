//
//  MovieListResponse.swift
//  ituneMovie
//
//  Created by Giap on 25/11/2022.
//

import Foundation

struct MovieListResponse : Codable {
    let resultCount : Int?
    let results : [Movie]?

    enum CodingKeys: String, CodingKey {

        case resultCount = "resultCount"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
        results = try values.decodeIfPresent([Movie].self, forKey: .results)
    }

}
