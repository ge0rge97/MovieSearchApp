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
        
        self.navigationItem.leftBarButtonItem = createBackButton()
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
//MARK: - Private Methods
private extension DetailsViewController {
    
    func setupButtonActions() {
        mainView.getDetailsButton.addTarget(self, action: #selector(getDetailsButtonAction), for: .touchUpInside)
        mainView.addAddToListViewRecognizer(withTarget: self, andAction: #selector(self.addToListViewRecognizer(_ :)))
        mainView.addSharedViewRecognizer(withTarget: self, andAction: #selector(self.sharedViewRecognizer(_ :)))
    }
    func createBackButton() -> UIBarButtonItem {
        var image = UIImage(systemName: "chevron.backward.circle.fill")
        image = image?.withRenderingMode(.alwaysOriginal)
        
        return UIBarButtonItem(image: image, style: .done, target: self, action: #selector(backButtonAction))
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
    
    func backButtonAction() {
        self.navigationController?.popViewController(animated:true)
    }
    func getDetailsButtonAction() {
        viewModel?.getMoreInformation(completion: { movieUrl in
            UIApplication.shared.open(movieUrl, options: [:], completionHandler: nil)
        })
    }
    func addToListViewRecognizer(_ sender: UITapGestureRecognizer) {
        viewModel?.addSelectedMovieToList()
        self.bindListViewModelOutput()
    }
    func sharedViewRecognizer(_ sender: UITapGestureRecognizer) {
        guard let viewModel = viewModel else { return }
        let sharedActivityController = UIActivityViewController(activityItems: [URL(string: "\(R.StringURLs.movieDatabaseInfo)\(viewModel.movieId)") as Any],
                                                                                    applicationActivities: nil)
        
        present(sharedActivityController, animated: true)
    }
}
//MARK: - Bind ViewModels
private extension DetailsViewController {
    func bindListViewModelOutput() {
        viewModel?.listViewModelOutput.bind({ [weak self] isAdded in
            self?.getAlertWithError(error: isAdded)
        })
    }
}
