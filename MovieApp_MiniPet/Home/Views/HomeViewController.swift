//
//  HomeViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class HomeViewController: BaseViewController<HomeRootView> {
    
    private var dataSource: UICollectionViewDiffableDataSource<HomeCollectionViewSection, AnyHashable>!
    
    private var trendingViewModel: HomeViewModelProtocol = HomeViewModel()
    private var upcomingViewModel: HomeViewModelProtocol = HomeViewModel()
    private var internetConnectionViewModel: InternetConnectionViewModelProtocol = InternetConnectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        setupCollectionViewDataSource()
        bindMovieViewModel()
        bindInternetConnectionViewModel()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.trendingViewModel.getFetchedData(withCategory: .trending)
        self.upcomingViewModel.getFetchedData(withCategory: .upcoming)
    }
}
//MARK: - Private Methods
private extension HomeViewController {
    
    func setupNavigationBar() {
        self.navigationItem.title = "Home"
        self.navigationItem.rightBarButtonItem = self.createLogOutBarButton()
    }
    func createLogOutBarButton() -> UIBarButtonItem {
        return UIBarButtonItem.menuButton(self, action: #selector(logOutButtonAction),
                                          imageName: "logout", tintColor: R.Colors.baseButtonColor)
    }
    func setupCollectionView() {
        mainView.collectionView.register(UpcomingMovieCollectionViewCell.self,
                                         forCellWithReuseIdentifier: UpcomingMovieCollectionViewCell.reuseId)
        mainView.collectionView.register(TrendingMovieCollectionViewCell.self,
                                         forCellWithReuseIdentifier: TrendingMovieCollectionViewCell.reuseId)
        mainView.collectionView.register(HomeCollectionViewHeaderCell.self,
                                         forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                         withReuseIdentifier: HomeCollectionViewHeaderCell.reuseId)
        mainView.collectionView.delegate = self
    }
    func bindMovieViewModel() {
        trendingViewModel.isLoading.bind { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.mainView.indicatorView.startAnimating()
                } else {
                    self?.mainView.indicatorView.stopAnimating()
                    self?.reloadData()
                }
            }
        }
        upcomingViewModel.isLoading.bind { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.mainView.indicatorView.startAnimating()
                } else {
                    self?.mainView.indicatorView.stopAnimating()
                    self?.reloadData()
                }
            }
        }
    }
}
//MARK: - Setup CollectionsView with DataSource
private extension HomeViewController {
    
    func setupCollectionViewDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<HomeCollectionViewSection, AnyHashable>(collectionView: mainView.collectionView,
                                                                                                     cellProvider: { [weak self] collectionView, indexPath, itemIdentifier in
            
            guard let section = HomeCollectionViewSection(rawValue: indexPath.section)
            else { return UICollectionViewCell() }
            
            switch section {
            case .upcomingMovies:
                guard let cell = self?.mainView.collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingMovieCollectionViewCell.reuseId,
                                                                                   for: indexPath) as? UpcomingMovieCollectionViewCell
                else { return UICollectionViewCell() }
                cell.cellViewModel = self?.upcomingViewModel.cellViewModel(forIndexPath: indexPath)
                return cell
            case .trendingMovies:
                guard let cell = self?.mainView.collectionView.dequeueReusableCell(withReuseIdentifier: TrendingMovieCollectionViewCell.reuseId,
                                                                                   for: indexPath) as? TrendingMovieCollectionViewCell
                else { return UICollectionViewCell() }
                cell.cellViewModel = self?.trendingViewModel.cellViewModel(forIndexPath: indexPath)
                cell.savedButton.addTarget(self, action: #selector(self?.savedButtonTrendingCellAction), for: .touchUpInside)
                return cell
            }
        })
        self.dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            
            guard let section = HomeCollectionViewSection(rawValue: indexPath.section),
                  let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                      withReuseIdentifier: HomeCollectionViewHeaderCell.reuseId,
                                                                                      for: indexPath)
                    as? HomeCollectionViewHeaderCell
            else { fatalError() }
            switch section {
            case .upcomingMovies:
                sectionHeader.configureTitle(title: section.setTitleHeader(forSection: .upcomingMovies))
            case .trendingMovies:
                sectionHeader.configureTitle(title: section.setTitleHeader(forSection: .trendingMovies))
            }
            return sectionHeader
        }
    }
    func reloadData() {
        
        var snapshot = NSDiffableDataSourceSnapshot<HomeCollectionViewSection, AnyHashable>()
        snapshot.appendSections([.upcomingMovies, .trendingMovies])
        snapshot.appendItems(upcomingViewModel.movieData, toSection: .upcomingMovies)
        snapshot.appendItems(trendingViewModel.movieData, toSection: .trendingMovies)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
}
//MARK: - CollectionView Delegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = DetailsViewController()
        
        guard let section = HomeCollectionViewSection(rawValue: indexPath.section) else { return }
        switch section {
        case .upcomingMovies:
            upcomingViewModel.selectRow(atIndexPath: indexPath)
            detailVC.viewModel = upcomingViewModel.viewModelForSelectedRow()
        case .trendingMovies:
            trendingViewModel.selectRow(atIndexPath: indexPath)
            detailVC.viewModel = trendingViewModel.viewModelForSelectedRow()
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
//MARK: - Buttons Action
@objc
private extension HomeViewController {
    
    func logOutButtonAction() {
        print(#function)
    }
    func savedButtonTrendingCellAction(_ sender: UIButton) {
        guard let indexPath = self.getCurrentIndexPath(withSender: sender,
                                                       andCollectionView: mainView.collectionView) else { return }
        trendingViewModel.addSelectedMovieToList(atIndexPath: indexPath)
    }
}
//MARK: - Network Monitoring
private extension HomeViewController {
    func bindInternetConnectionViewModel() {
        internetConnectionViewModel.isInternetConnection.bind { [weak self] isConnected in
            if isConnected {
                self?.mainView.checkInternetConnection(isConnection: true)
            } else {
                self?.mainView.checkInternetConnection(isConnection: false)
                self?.navigationController?.navigationBar.isHidden = true
                self?.tabBarController?.tabBar.isHidden = true
            }
        }
    }
}
