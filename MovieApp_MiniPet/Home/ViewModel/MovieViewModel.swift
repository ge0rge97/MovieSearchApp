//
//  MovieViewModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 20.12.2022.
//

import Foundation

protocol MovieViewModelProtocol {
    
    var movieData: [MovieModel] { get }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailMovieViewModelProtocol?
    //func selectRow(atIndexPath indexPath: IndexPath)
    //func viewModelForSelectedRow() -> PhotoCellViewModelProtocol?
}

class MovieViewModel: MovieViewModelProtocol {
    
    let networking = NetworkingViewModel()
    
    private var selectedIndexPath: IndexPath?
    private var fetchedMovieData: [Result]?
    
    var movieData: [MovieModel] {

        var array: [MovieModel] = []
        for (index, _) in fetchedMovieData?.enumerated() ?? [].enumerated() {
            array.append(MovieModel(movieId: fetchedMovieData?[index].id ?? 1,
                                    movieTitle: fetchedMovieData?[index].title ?? "",
                                    movieImagePath: fetchedMovieData?[index].posterPath ?? "",
                                    movieOverview: fetchedMovieData?[index].overview ?? "",
                                    movieGenres: "NEED TO IMPROVE",
                                    releaseDate: fetchedMovieData?[index].releaseDate ?? "",
                                    averageRating: fetchedMovieData?[index].voteAverage ?? 0))
        }
        return array
    }
    
    init(withFetchedData fetchedData: [Result]) {
        self.fetchedMovieData = fetchedData
    }
}
//MARK: - CellViewModel
extension MovieViewModel {
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailMovieViewModelProtocol? {
        let item = movieData[indexPath.item]
        return DetailViewModel(item: item)
    }
}
//MARK: - Selected Items for DetailVMProtocol
extension MovieViewModel {

    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }

    func viewModelForSelectedRow(withData data: [MovieModel]) -> DetailMovieViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        let item = data[selectedIndexPath.item]
        return DetailViewModel(item: item)
    }
}

//MARK: - Format Genre
//private extension UpcomingMovieViewModel {
//
//    var genre: String {
//        var id: Int = 0
//        for (index, _) in fetchedMovieData?.enumerated() ?? [Result]().enumerated() {
//            id = fetchedMovieData?[index].genreIDS.first ?? 0
//        }
//
//        switch id {
//
//        case 28: return "Action"
//        case 12: return "Adventure"
//        case 16: return "Animation"
//        case 35: return "Comedy"
//        case 80: return "Crime"
//        case 99: return "Documentary"
//        case 18: return "Drama"
//        case 10751: return "Family"
//        case 14: return "Fantasy"
//        case 26: return "History"
//        case 27: return "Horror"
//        case 10402: return "Music"
//        case 9648: return "Mystery"
//        case 10749: return "Romance"
//        case 878: return "Science Fiction"
//        case 10770: return "TV Movie"
//        case 53: return "Thriller"
//        case 10752: return "War"
//        case 37: return "Western"
//        default: return ""
//        }
//    }
//}
