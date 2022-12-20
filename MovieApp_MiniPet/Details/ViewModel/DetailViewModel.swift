//
//  DetailViewModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 20.12.2022.
//

import Foundation

protocol DetailMovieViewModelProtocol: AnyObject {
    var imageName: String { get }
    var title: String { get }
    var date: String { get }
    var rating: String { get }
    var overview: String { get }
    var genre: String { get }
}

class DetailViewModel: DetailMovieViewModelProtocol {
    private var item: MovieModel
    
    var title: String {
        return item.movieTitle
    }
    var imageName: String {
        return item.movieImagePath
    }
    var date: String {
        return item.releaseDate
    }
    var rating: String {
        return String(format: "%.2f", item.averageRating)
    }
    var overview: String {
        return item.movieOverview
    }
    var genre: String {
        return "item.movieGenres"
    }
    
    init(item: MovieModel) {
        self.item = item
    }
}
