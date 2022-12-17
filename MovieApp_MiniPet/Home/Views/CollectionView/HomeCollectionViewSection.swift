//
//  HomeCollectionViewSection.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import Foundation

enum HomeCollectionViewSection: Int, CaseIterable {
    
    case upcomingMovies
    case trendingMovies
}
//MARK: - Title for Sections Header
extension HomeCollectionViewSection {
    
    func setTitleHeader(forSection: HomeCollectionViewSection) -> String {
        switch self {
        case .upcomingMovies:
            return "Soon on screen"
        case .trendingMovies:
            return "Trending now"
        }
    }
}
