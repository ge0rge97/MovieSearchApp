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
        mainView.getDetailsButton.addTarget(self, action: #selector(getDetailsButtonAction), for: .touchUpInside)
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
        let url = URL(string: "\(R.StringURLs.movieDatabaseImage)\(viewModel.imageName)")
        mainView.detailsMovieImage.sd_setImage(with: url)
    }
}
//MARK: - Buttons Action
@objc
private extension DetailsViewController {
    
    func getDetailsButtonAction() {
        viewModel?.getMoreInformation(completion: { movieUrl in
            UIApplication.shared.open(movieUrl, options: [:], completionHandler: nil)
        })
    }
    func addToListViewRecognizer(_ sender: UITapGestureRecognizer) {
        viewModel?.addSelectedMovieToList()
    }
    func sharedViewRecognizer(_ sender: UITapGestureRecognizer) {
        guard let viewModel = viewModel else { return }
        let sharedActivityController = UIActivityViewController(activityItems: [URL(string: "\(R.StringURLs.movieDatabaseInfo)\(viewModel.movieId)") as Any],
                                                                                    applicationActivities: nil)
        
        present(sharedActivityController, animated: true)
    }
}
