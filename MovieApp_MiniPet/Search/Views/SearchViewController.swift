//
//  SearchViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 19.12.2022.
//

import UIKit

final class SearchViewController: BaseViewController<SearchRootView> {
    
    private var dataSource: UICollectionViewDiffableDataSource<SearchCollectionViewSection, AnyHashable>!
    private var searchViewModel: SearchMovieViewModelProtocol = SearchMovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        setupCollectionView()
        setupCollectionViewDataSource()
        reloadData()
    }
}
//MARK: - Private Methods
private extension SearchViewController {
    
    func setupNavigationItem() {
        mainView.searchBar.delegate = self
        navigationItem.titleView = mainView.searchBar
    }
    func setupCollectionView() {
        mainView.collectionView.register(SearchCollectionViewCell.self,
                                         forCellWithReuseIdentifier: SearchCollectionViewCell.reuseId)
        mainView.collectionView.delegate = self
    }
    func bindViewModel() {
        searchViewModel.isLoading.bind { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.mainView.indicatorView.startAnimating()
                } else {
                    self?.mainView.indicatorView.stopAnimating()
                }
            }
        }
    }
}
//MARK: - Setup CollectionsView with DataSource
private extension SearchViewController {
    
    func setupCollectionViewDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<SearchCollectionViewSection, AnyHashable>(collectionView: mainView.collectionView,
                                                                                   cellProvider: { [weak self] collectionView, indexPath, itemIdentifier in
            
            guard let section = SearchCollectionViewSection(rawValue: indexPath.section)
                else { return UICollectionViewCell() }
                  
            switch section {
            case .search:
                guard let cell = self?.mainView.collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseId,
                                                                                   for: indexPath) as? SearchCollectionViewCell
                else { return UICollectionViewCell() }
                cell.cellViewModel = self?.searchViewModel.cellViewModel(forIndexPath: indexPath)
                return cell
            }
        })
    }
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<SearchCollectionViewSection, AnyHashable>()
        snapshot.appendSections([.search])
        snapshot.appendItems(searchViewModel.movieData, toSection: .search)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
}
//MARK: - CollectionView Delegate
extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailsViewController()
        
        searchViewModel.selectRow(atIndexPath: indexPath)
        detailVC.viewModel = searchViewModel.viewModelForSelectedRow()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
//MARK: - SearchBar Delegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel.getFetchedData(withSearchTerm: searchText)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] _ in
            self?.reloadData()
            
        })
        self.bindViewModel()
    }
}
