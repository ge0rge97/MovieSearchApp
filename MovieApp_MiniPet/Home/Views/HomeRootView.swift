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
    let indicatorView = UIActivityIndicatorView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
//MARK: - Required Methods
extension HomeRootView {
    
    override func setupViews() {
        [collectionView, indicatorView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        [indicatorView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        indicatorView.color = R.Colors.mainWhite
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
