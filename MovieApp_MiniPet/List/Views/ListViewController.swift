//
//  ListViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 19.12.2022.
//

import UIKit

final class ListViewController: BaseViewController<ListRootView> {
    
    private var dataSource: UICollectionViewDiffableDataSource<ListCollectionViewSection, AnyHashable>!
    private var listViewModel: ListViewModelProtocol = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        setupCollectionViewDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
                cell.cellViewModel = self?.listViewModel.cellViewModel(forIndexPath: indexPath)
                cell.removedButton.addTarget(self, action: #selector(self?.removeButtonAction), for: .touchUpInside)
                return cell
            }
        })
    }
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<ListCollectionViewSection, AnyHashable>()
        snapshot.appendSections([.saved])
        snapshot.appendItems(listViewModel.movieData, toSection: .saved)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
}
//MARK: - CollectionView Delegate
extension ListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = DetailsViewController()
        listViewModel.selectRow(atIndexPath: indexPath)
        detailVC.viewModel = listViewModel.viewModelForSelectedRow()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
//MARK: - Actions
@objc
private extension ListViewController {
    
    func removeButtonAction(_ sender: UIButton) {
        guard let indexPath = self.getCurrentIndexPath(withSender: sender,
                                                       andCollectionView: mainView.collectionView) else { return }
        listViewModel.removedSelectedMovieFromList(forIndexPath: indexPath)
        self.reloadData()
    }
}
