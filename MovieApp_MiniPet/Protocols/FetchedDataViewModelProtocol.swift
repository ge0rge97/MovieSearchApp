//
//  FetchedDataViewModelProtocol.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 23.12.2022.
//

import Foundation

protocol FetchedDataViewModelProtocol {
    
    var fetchedMovieData: [Result]? { get }
    var isLoading: ViewModelObservable<Bool> { get }
}

extension FetchedDataViewModelProtocol {
    
    var genres: [String] {
        
        var array: [String] = []
        for (index, _) in fetchedMovieData?.enumerated() ?? [Result]().enumerated() {
            
            let id = fetchedMovieData?[index].genreIDS.first ?? 0
            var genre: String = ""
            
            switch id {
                
            case 28: genre = "Action"
            case 12: genre = "Adventure"
            case 16: genre = "Animation"
            case 35: genre = "Comedy"
            case 80: genre = "Crime"
            case 99: genre = "Documentary"
            case 18: genre = "Drama"
            case 10751: genre = "Family"
            case 14: genre = "Fantasy"
            case 26: genre = "History"
            case 27: genre = "Horror"
            case 10402: genre = "Music"
            case 9648: genre = "Mystery"
            case 10749: genre = "Romance"
            case 878: genre = "Science Fiction"
            case 10770: genre = "TV Movie"
            case 53: genre = "Thriller"
            case 10752: genre = "War"
            case 37: genre = "Western"
            default: genre = ""
                
            }
            array.append(genre)
            
            if array.count >= 3 {
                break
            }
        }
        return array
    }
}
