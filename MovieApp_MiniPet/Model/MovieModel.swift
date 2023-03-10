//
//  MovieModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import Foundation

struct MovieModel: Hashable, Codable {
    
    let movieId: Int
    let movieTitle: String
    let movieImagePath: String
    let movieOverview: String
    let movieGenres: String
    let releaseDate: String
    let averageRating: Double
    
    let uuid = UUID()
    static func == (lhs: MovieModel, rhs: MovieModel) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    private enum CodingKeys: CodingKey {
        case movieId
        case movieTitle
        case movieImagePath
        case movieOverview
        case movieGenres
        case releaseDate
        case averageRating
    } //Required Hashable Methods
}
