//
//  HomeRootView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class HomeRootView: BaseView {
    
    lazy var collectionView = BaseCollectionView(withLayout: createCompositionalLayout())
    let compositionalLayoutFactory = CompositionalLayoutFactory()
}
//MARK: - Required Methods
extension HomeRootView {
    
    override func setupViews() {
        [collectionView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        self.collectionView.backgroundColor = .brown
    }
}
//MARK: - CollectionView CompositionalLayout
private extension HomeRootView {
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { index, environment -> NSCollectionLayoutSection? in
            
            guard let section = HomeCollectionViewSection(rawValue: index) else { fatalError() }
            
            switch section {
            case .upcomingMovies:
                return self.compositionalLayoutFactory.createCompositionalLayout(sectionType: .upcomingMovies).createCompositionalLayoutForSection()
            case .trendingMovies:
                return self.compositionalLayoutFactory.createCompositionalLayout(sectionType: .trendingMovies).createCompositionalLayoutForSection()
            }
        }
        return layout
    }
}
