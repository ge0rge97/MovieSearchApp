//
//  HomeViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class HomeViewController: BaseViewController<HomeRootView> {
    
    private var dataSource: UICollectionViewDiffableDataSource<HomeCollectionViewSection, AnyHashable>!
    
    var upcomingMovieData: [MovieModel] = [
        MovieModel(movieId: 1, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 2),
        MovieModel(movieId: 2, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 3),
        MovieModel(movieId: 1, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 2),
        MovieModel(movieId: 2, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 3),
    ]
    
    var trendingMovieData: [MovieModel] = [
        MovieModel(movieId: 1, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 2),
        MovieModel(movieId: 2, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 3),
        MovieModel(movieId: 1, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 2),
        MovieModel(movieId: 2, movieTitle: "", movieImagePath: "", movieOverview: "", movieGenres: [], releaseDate: "", averageRating: 3)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        setupCollectionViewDataSource()
        reloadData()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
                
                cell.layer.borderWidth = 2
                
                return cell
            case .trendingMovies:
                guard let cell = self?.mainView.collectionView.dequeueReusableCell(withReuseIdentifier: TrendingMovieCollectionViewCell.reuseId,
                                                                                   for: indexPath) as? TrendingMovieCollectionViewCell
                    else { return UICollectionViewCell() }
                
                cell.layer.borderWidth = 1
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
        snapshot.appendItems(upcomingMovieData, toSection: .upcomingMovies)
        snapshot.appendItems(trendingMovieData, toSection: .trendingMovies)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
}
//MARK: - Buttons Action
@objc
private extension HomeViewController {
    
    func logOutButtonAction() {
        print(#function)
    }
    func savedButtonTrendingCellAction() {
        print(#function)
    }
}
