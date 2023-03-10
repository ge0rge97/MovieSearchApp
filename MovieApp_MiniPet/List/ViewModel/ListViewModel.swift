//
//  ListViewModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 23.12.2022.
//

import Foundation
import FirebaseAuth

protocol ListViewModelProtocol: MovieViewModelProtocol {
    
    var movieData: [MovieModel] { get set }
    func addItem(_ item: MovieModel?)
    func removedSelectedMovieFromList(forIndexPath indexPath: IndexPath)
}

protocol ListViewModelOutput: AnyObject {
    
    func listViewModelOutput(withTitle title: String)
}

class ListViewModel: ListViewModelProtocol {
    
    weak var listViewModelOutput: ListViewModelOutput?
    
    private let savedSystem = MementoStateSaver()
    private var selectedIndexPath: IndexPath?
    private var currentUser = Auth.auth().currentUser
    
    var movieData: [MovieModel] {
        get {
            do {
                return try savedSystem.load(currentUser?.uid ?? "unknown")
            } catch let error {
                print(error.localizedDescription)
                return []
            }
        }
        set {
            do {
                try savedSystem.save(newValue, title: currentUser?.uid ?? "unknown")
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
            self.listViewModelOutput?.listViewModelOutput(withTitle: "\(item.movieTitle) is already here.")
        } else {
            self.listViewModelOutput?.listViewModelOutput(withTitle: "\(item.movieTitle) added to favourite.")
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
            self.listViewModelOutput?.listViewModelOutput(withTitle: "\(item.movieTitle) removed")
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
