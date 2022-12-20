//
//  MovieNetworkingDataModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 20.12.2022.
//

import Foundation

struct MovieNetworkingDataModel: Codable {
    let results: [Result]
}

struct Result: Codable {
    let genreIDS: [Int]
    let id: Int
    let overview: String
    let posterPath: String?
    let releaseDate, title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}
