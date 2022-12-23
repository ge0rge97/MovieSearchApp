//
//  ListViewModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 23.12.2022.
//

import Foundation

protocol ListViewModelProtocol: MovieViewModelProtocol {
    
    var movieData: [MovieModel] { get set }
    func addItem(_ item: MovieModel?)
    func removedSelectedMovieFromList(forIndexPath indexPath: IndexPath)
}

class ListViewModel: ListViewModelProtocol {
    
    private let savedSystem = MementoStateSaver()
    private var selectedIndexPath: IndexPath?
    
    var movieData: [MovieModel] {
        get {
            do {
                return try savedSystem.load("listViewModeSaveKey")
            } catch let error {
                print(error.localizedDescription)
                return []
            }
        }
        set {
            do {
                try savedSystem.save(newValue, title: "listViewModeSaveKey")
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func addItem(_ item: MovieModel?) {
        guard let item = item else { return }
        if let _ = movieData.firstIndex(where: { (arrayItem) -> Bool in
            return arrayItem.movieId == item.movieId
        }) {
            print("\(item.movieTitle) is already here.")
        } else {
            print("\(item.movieTitle) added to favourite.")
            movieData.insert(item, at: movieData.endIndex)
        }
    }
    
}
//MARK: - Removed Item
extension ListViewModel {
    
    private func removeItem(_ item: MovieModel?) {
        guard let item = item else { return }
        if let index = movieData.firstIndex(where: { (arrayItem) -> Bool in
            return arrayItem.movieId == item.movieId
        }) {
            movieData.remove(at: index)
            print("\(item.movieTitle) removed")
        }
    }
    
    func removedSelectedMovieFromList(forIndexPath indexPath: IndexPath) {
        let item = movieData[indexPath.item]
        self.removeItem(item)
    }
}
//MARK: - CellViewModel
extension ListViewModel {
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailMovieViewModelProtocol? {
        let item = movieData[indexPath.item]
        return DetailViewModel(item: item)
    }
}
//MARK: - Selected Items for DetailVMProtocol
extension ListViewModel {
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    func viewModelForSelectedRow() -> DetailMovieViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        let item = movieData[selectedIndexPath.item]
        return DetailViewModel(item: item)
    }
}
