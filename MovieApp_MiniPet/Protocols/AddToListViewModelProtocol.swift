//
//  AddToListViewModelProtocol.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 23.12.2022.
//

import Foundation

protocol AddToListViewModelProtocol {
    
    var listViewModelOutput: ViewModelObservable<String> { get }
    func addSelectedMovieToList(atIndexPath indexPath: IndexPath)
}
