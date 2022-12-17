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
        
        self.navigationItem.title = "Trending now"
        self.navigationItem.rightBarButtonItem = self.createLogOutBarButton()
    }
    func createLogOutBarButton() -> UIBarButtonItem {
        
        return UIBarButtonItem.menuButton(self, action: #selector(logOutButtonAction),
                                          imageName: "logout", tintColor: R.Colors.baseButtonColor)
        
    }
    func setupCollectionView() {
        
        mainView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}
//MARK: - Setup CollectionsView with DataSource
private extension HomeViewController {
    
    func setupCollectionViewDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<HomeCollectionViewSection, AnyHashable>(collectionView: mainView.collectionView,
                                                                                   cellProvider: { [weak self] collectionView, indexPath, itemIdentifier in
            
            guard let section = HomeCollectionViewSection(rawValue: indexPath.section) else { return UICollectionViewCell() }
                  
            let cell = self?.mainView.collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                                               for: indexPath)
            
            cell?.layer.borderWidth = 2
            
            return cell
        })
//        self.dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
//
//            guard let section = Section(rawValue: indexPath.section),
//                  let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainScreenCollectionViewHeaderCell.reuseId, for: indexPath)
//                    as? MainScreenCollectionViewHeaderCell
//            else { fatalError() }
//
//            switch section {
//            case .popularMovie: sectionHeader.configureTitle(title: section.setTitleHeader(forSection: .popularMovie))
//            case .tvShow: sectionHeader.configureTitle(title: section.setTitleHeader(forSection: .popularMovie))
//            }
//
//            return sectionHeader
//        }
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
}
