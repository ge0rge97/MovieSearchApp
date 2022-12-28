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
    var movieId: Int { get }
    
    func addSelectedMovieToList()
    func getMoreInformation(completion: @escaping (URL) -> ())
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
        return item.movieGenres
    }
    var movieId: Int {
        return item.movieId
    }
    
    init(item: MovieModel) {
        self.item = item
    }
}
//MARK: - Add to List
extension DetailViewModel {
    
    func addSelectedMovieToList() {
        let listVM = ListViewModel()
        listVM.addItem(item)
    }
}
//MARK: - Search Movie on Google
extension DetailViewModel {
    
    func getMoreInformation(completion: @escaping (URL) -> ()) {
        let url = URL(string: "\(R.StringURLs.movieDatabaseInfo)\(item.movieId)")
        if let url = url {
            completion(url)
        }
    }
}
