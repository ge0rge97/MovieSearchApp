//
//  ListRootView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 19.12.2022.
//

import UIKit

final class ListRootView: BaseView {
    
    lazy var collectionView = BaseCollectionView(withLayout: createCompositionalLayout())
    private let compositionalLayout = SavedMovieCompositionalLayout(isHeaderNeeded: false)
}
//MARK: - Required Methods
extension ListRootView {
    
    override func setupViews() {
        [collectionView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
    }
}
//MARK: - CollectionView CompositionalLayout
private extension ListRootView {
    
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
