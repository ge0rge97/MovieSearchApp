//
//  MainViewModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 20.12.2022.
//

import Foundation

//MARK: - ViewModel for HomeVC & SearchVC

protocol MainViewModelProtocol: MovieViewModelProtocol, AddToListViewModelProtocol, FetchedDataViewModelProtocol {
    
    func getFetchedData(withCategory category: PathMovieCategory)
    func getFetchedData(withSearchTerm searchTerm: String)
}

class MainViewModel: MainViewModelProtocol {
    
    private var selectedIndexPath: IndexPath?
    private let networking = NetworkViewModel()
    
    private let listVM = ListViewModel()
    var listViewModelOutput: ViewModelObservable<String> = ViewModelObservable("")
    
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
        networking.fetchMovieData(withPath: category) { [weak self] result in
            switch result {
            case .success(let fetchedMovieData):
                self?.fetchedMovieData = fetchedMovieData
                self?.isLoading.value = false
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func getFetchedData(withSearchTerm searchTerm: String) {
        if isLoading.value {
            return
        }
        isLoading.value = true
        networking.fetchMovieDataWithSearch(withSearchTerm: searchTerm) { [weak self] result in
            switch result {
            case .success(let fetchedMovieData):
                self?.fetchedMovieData = fetchedMovieData
                self?.isLoading.value = false
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
//MARK: - CellViewModel
extension MainViewModel {
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailMovieViewModelProtocol? {
        let item = movieData[indexPath.item]
        return DetailViewModel(item: item)
    }
}
//MARK: - Selected Items for DetailVMProtocol CellViewModel
extension MainViewModel {

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
extension MainViewModel {
    
    func addSelectedMovieToList(atIndexPath indexPath: IndexPath) {
        let item = movieData[indexPath.item]
        listVM.listViewModelOutput = self
        listVM.addItem(item)
    }
}
//MARK: - ListViewModel Output
extension MainViewModel: ListViewModelOutput {
    
    func listViewModelOutput(withTitle title: String) {
        self.listViewModelOutput.value = title
    }
}
