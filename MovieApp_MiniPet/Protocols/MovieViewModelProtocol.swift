//
//  MovieViewModelProtocol.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 23.12.2022.
//

import Foundation

protocol MovieViewModelProtocol {
    
    var movieData: [MovieModel] { get }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailMovieViewModelProtocol?
    func selectRow(atIndexPath indexPath: IndexPath)
    func viewModelForSelectedRow() -> DetailMovieViewModelProtocol?
}
