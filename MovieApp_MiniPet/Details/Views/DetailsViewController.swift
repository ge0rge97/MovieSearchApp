//
//  DetailsViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 18.12.2022.
//

import UIKit
import SDWebImage

final class DetailsViewController: BaseViewController<DetailsRootView> {
    
    var viewModel: DetailMovieViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonActions()
        setupViewModel()
    }
}
//MARK: - Private Methods
private extension DetailsViewController {
    
    func setupButtonActions() {
        mainView.watchNowButton.addTarget(self, action: #selector(watchNowButtonAction), for: .touchUpInside)
        mainView.addAddToListViewRecognizer(withTarget: self, andAction: #selector(self.addToListViewRecognizer(_ :)))
        mainView.addSharedViewRecognizer(withTarget: self, andAction: #selector(self.sharedViewRecognizer(_ :)))
    }
    func setupViewModel() {
        guard let viewModel = viewModel else { return }
        
        mainView.detailsMoveTitle.text = viewModel.title
        mainView.releasedMovieYearLabel.text = viewModel.date
        mainView.detailsMovieOverviewLabel.text = viewModel.overview
        mainView.genresLabel.text = viewModel.genre
        mainView.addRating(withRating: viewModel.rating)
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.imageName)")
        mainView.detailsMovieImage.sd_setImage(with: url)
    }
}
//MARK: - Buttons Action
@objc
private extension DetailsViewController {
    
    func watchNowButtonAction() {
        print(#function)
    }
    func addToListViewRecognizer(_ sender: UITapGestureRecognizer) {
        viewModel?.addSelectedMovieToList()
    }
    func sharedViewRecognizer(_ sender: UITapGestureRecognizer) {
        print(#function)
    }
}
