//
//  ListViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 19.12.2022.
//

import UIKit

final class ListViewController: BaseViewController<ListRootView> {
    
    private var dataSource: UICollectionViewDiffableDataSource<ListCollectionViewSection, AnyHashable>!
    
    var savedMovieData: [MovieModel] = [
        MovieModel(movieId: 1, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 2),
        MovieModel(movieId: 2, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 3),
        MovieModel(movieId: 1, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 2),
        MovieModel(movieId: 2, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 3),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        setupCollectionViewDataSource()
        reloadData()
    }
}
//MARK: - Private Methods
private extension ListViewController {
    
    func setupNavigationBar() {
        self.navigationItem.title = "Your List"
    }
    func setupCollectionView() {
        mainView.collectionView.register(SavedCollectionViewCell.self,
                                         forCellWithReuseIdentifier: SavedCollectionViewCell.reuseId)
        mainView.collectionView.delegate = self
    }
}
//MARK: - Setup CollectionsView with DataSource
private extension ListViewController {
    
    func setupCollectionViewDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<ListCollectionViewSection, AnyHashable>(collectionView: mainView.collectionView,
                                                                                   cellProvider: { [weak self] collectionView, indexPath, itemIdentifier in
            
            guard let section = ListCollectionViewSection(rawValue: indexPath.section)
                else { return UICollectionViewCell() }
                  
            switch section {
            case .saved:
                guard let cell = self?.mainView.collectionView.dequeueReusableCell(withReuseIdentifier: SavedCollectionViewCell.reuseId,
                                                                                   for: indexPath) as? SavedCollectionViewCell
                else { return UICollectionViewCell() }
                
                
                
                return cell
            }
        })
    }
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<ListCollectionViewSection, AnyHashable>()
        snapshot.appendSections([.saved])
        snapshot.appendItems(savedMovieData, toSection: .saved)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
}
//MARK: - CollectionView Delegate
extension ListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
