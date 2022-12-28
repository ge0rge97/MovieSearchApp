//
//  HomeViewModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 20.12.2022.
//

import Foundation

protocol HomeViewModelProtocol: MovieViewModelProtocol, AddToListViewModelProtocol, FetchedDataViewModelProtocol {
    
    func getFetchedData(withCategory category: PathMovieCategory)
}

class HomeViewModel: HomeViewModelProtocol {
    
    private var selectedIndexPath: IndexPath?
    private let networking = NetworkViewModel()
    
    var fetchedMovieData: [Result]?
    var isLoading: ViewModelObservable<Bool> = ViewModelObservable(false)
    
    var movieData: [MovieModel] {
        var array: [MovieModel] = []
        for (index, _) in fetchedMovieData?.enumerated() ?? [].enumerated() {
            array.append(MovieModel(movieId: fetchedMovieData?[index].id ?? 1,
                                    movieTitle: fetchedMovieData?[index].title ?? "",
                                    movieImagePath: fetchedMovieData?[index].posterPath ?? "",
                                    movieOverview: fetchedMovieData?[index].overview ?? "",
                                    movieGenres: genres.joined(separator:" ⠐ "),
                                    releaseDate: String.convertDateFormat(sourceDateString: fetchedMovieData?[index].releaseDate ?? ""),
                                    averageRating: fetchedMovieData?[index].voteAverage ?? 0))
        }
        return array
    }
    
    func getFetchedData(withCategory category: PathMovieCategory) {
        if isLoading.value {
            return
        }
        isLoading.value = true
        networking.fetchMovieData(withPath: category) { result in
            self.isLoading.value = false
            self.fetchedMovieData = result
        }
    }
}
//MARK: - CellViewModel
extension HomeViewModel {
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailMovieViewModelProtocol? {
        let item = movieData[indexPath.item]
        return DetailViewModel(item: item)
    }
}
//MARK: - Selected Items for DetailVMProtocol CellViewModel
extension HomeViewModel {

    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    func viewModelForSelectedRow() -> DetailMovieViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        let item = movieData[selectedIndexPath.item]
        return DetailViewModel(item: item)
    }
}
//MARK: - Add To List
extension HomeViewModel {
    
    func addSelectedMovieToList(atIndexPath indexPath: IndexPath) {
        let item = movieData[indexPath.item]
        let listVM = ListViewModel()
        listVM.addItem(item)
    }
}
