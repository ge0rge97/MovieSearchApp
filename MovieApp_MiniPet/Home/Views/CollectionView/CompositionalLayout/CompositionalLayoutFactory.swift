//
//  CompositionalLayoutFactory.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

protocol CompositionalLayoutFactoryProtocol: AnyObject {
    func createCompositionalLayoutForSection() -> NSCollectionLayoutSection
}

class CompositionalLayoutFactory {
    
    func createCompositionalLayout(sectionType: HomeCollectionViewSection) -> CompositionalLayoutFactoryProtocol {
        
        switch sectionType {
        case .upcomingMovies:
            return UpcomingMovieCompositionalLayout()
        case .trendingMovies:
            return TrendingMovieCompositionalLayout()
        }
    }
}
