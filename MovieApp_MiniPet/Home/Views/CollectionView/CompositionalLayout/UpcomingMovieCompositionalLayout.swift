//
//  UpcomingMovieCompositionalLayout.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

class UpcomingMovieCompositionalLayout: CompositionalLayoutFactoryProtocol {
    
    func createCompositionalLayoutForSection() -> NSCollectionLayoutSection {
        let itemSize                        = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item                            = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize                       = NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(150))
        let group                           = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section                         = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing           = 20
        section.contentInsets               = NSDirectionalEdgeInsets.init(top: 46, leading: 20, bottom: 20, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        
        let sectionHeader = SectionHeader.shared.createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader] //Header
        
        return section
    }
}
