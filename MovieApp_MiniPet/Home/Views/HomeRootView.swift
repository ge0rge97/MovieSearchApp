//
//  HomeRootView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit
import Network

final class HomeRootView: BaseView {
    
    lazy var collectionView = BaseCollectionView(withLayout: createCompositionalLayout())
    let compositionalLayoutFactory = CompositionalLayoutFactory()
    let indicatorView = UIActivityIndicatorView()
    
    let noInternetConnectionView = NoInternetConnectionView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            noInternetConnectionView.topAnchor.constraint(equalTo: topAnchor),
            noInternetConnectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            noInternetConnectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            noInternetConnectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
}
//MARK: - Required Methods
extension HomeRootView {
    override func setupViews() {
        [collectionView, indicatorView, noInternetConnectionView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        [indicatorView, noInternetConnectionView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        indicatorView.color = R.Colors.mainWhite
    }
}
//MARK: - Internet Connection Method
extension HomeRootView {
    func checkInternetConnection(isConnection: Bool) {
        
        self.noInternetConnectionView.isHidden = isConnection
        self.collectionView.isHidden = !isConnection
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
