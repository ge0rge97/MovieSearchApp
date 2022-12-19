//
//  SearchMovieCompositionalLayout.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 19.12.2022.
//

import UIKit

class SearchMovieCompositionalLayout {
    
    static var shared = SearchMovieCompositionalLayout()
    
    func createCompositionalLayoutForSection() -> NSCollectionLayoutSection {
        let itemSize                        = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item                            = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.55))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        group.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 26, leading: 20, bottom: 20, trailing: 20)
        
        //let sectionHeader = SectionHeader.shared.createSectionHeader()
        //section.boundarySupplementaryItems = [sectionHeader] //Header
        
        return section
    }
}
