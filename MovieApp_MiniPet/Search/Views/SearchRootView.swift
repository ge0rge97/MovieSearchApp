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
}
//MARK: - Required Methods
extension SearchRootView {
    
    override func setupViews() {
        [collectionView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
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

