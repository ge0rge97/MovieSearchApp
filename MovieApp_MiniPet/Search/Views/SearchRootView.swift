//
//  SearchRootView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 19.12.2022.
//

import UIKit

final class SearchRootView: BaseView {
    
    let searchBar = MovieSearchBar()
    lazy var collectionView = BaseCollectionView(withLayout: createCompositionalLayout())
    let compositionalLayout = SearchMovieCompositionalLayout(isHeaderNeeded: false)
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
extension SearchRootView {
    
    override func setupViews() {
        [collectionView, indicatorView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        [indicatorView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        indicatorView.color = R.Colors.baseButtonColor
    }
}
//MARK: - CollectionView CompositionalLayout
private extension SearchRootView {
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { index, environment -> NSCollectionLayoutSection? in
            
            guard let section = ListCollectionViewSection(rawValue: index) else { fatalError() }
            switch section {
            case .saved:
                return self.compositionalLayout.createCompositionalLayoutForSection()
            }
        }
        return layout
    }
}
