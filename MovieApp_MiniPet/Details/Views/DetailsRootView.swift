//
//  DetailsRootView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 18.12.2022.
//

import UIKit
import SDWebImage

final class DetailsRootView: BaseView {
    
    let detailsMovieImage = UIImageView()
    
    let detailsMoveTitle = DetailsRootView.createDetailsMoveTitleLabel()
    let releasedMovieYearLabel = DetailsRootView.createReleasedMovieYearLabel()
    let genresLabel = DetailsRootView.createGenresLabel()
    let detailsMovieOverviewLabel = DetailsRootView.createDetailsMovieOverviewLabel()
    
    let watchNowButton = UIButton(type: .system)
    private let addToListView = DetailsRootView.createAddToListView()
    private let averageRatingView = DetailsRootView.createAverageRatingView()
    private let sharedView = DetailsRootView.createSharedView()
    
    private let helpersStackView = UIStackView()
    private let detailsStackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            detailsMovieImage.topAnchor.constraint(equalTo: topAnchor),
            detailsMovieImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailsMovieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailsMovieImage.heightAnchor.constraint(equalToConstant: self.bounds.height / 2.5),
            
            watchNowButton.heightAnchor.constraint(equalToConstant: 60),
            
            detailsStackView.topAnchor.constraint(equalTo: detailsMovieImage.bottomAnchor, constant: 10),
            detailsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            detailsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        
            helpersStackView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func addAddToListViewRecognizer(withTarget target: Any, andAction action: Selector) {
        
        let addToListRecognizer = UITapGestureRecognizer(target: target, action: action)
        addToListView.isUserInteractionEnabled = true
        addToListView.addGestureRecognizer(addToListRecognizer)
    }
    func addSharedViewRecognizer(withTarget target: Any, andAction action: Selector) {
        
        let addToListRecognizer = UITapGestureRecognizer(target: target, action: action)
        sharedView.isUserInteractionEnabled = true
        sharedView.addGestureRecognizer(addToListRecognizer)
    }
    func addRating(withRating rating: String) {
        averageRatingView.titleLabel.text = rating
    }
}
//MARK: - Required Methods
extension DetailsRootView {
    
    override func setupViews() {
        [addToListView, averageRatingView, sharedView].forEach{ helpersStackView.addArrangedSubview($0) }
        [detailsMoveTitle, releasedMovieYearLabel, genresLabel, watchNowButton, detailsMovieOverviewLabel, helpersStackView].forEach{ detailsStackView.addArrangedSubview($0) }
        [detailsMovieImage, detailsStackView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        [detailsStackView, detailsMovieImage, detailsMoveTitle, releasedMovieYearLabel, watchNowButton, helpersStackView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        detailsStackView.axis = .vertical
        detailsStackView.distribution = .fill
        detailsStackView.spacing = 14
        
        helpersStackView.distribution = .fillEqually
        
        watchNowButton.backgroundColor = R.Colors.mainWhite
        watchNowButton.setTitle("Watch Now", for: .normal)
        watchNowButton.setTitleColor(.black, for: .normal)
        watchNowButton.layer.cornerRadius = 10
    }
}
//MARK: - Private Create Methods
private extension DetailsRootView {
    
    static func createDetailsMoveTitleLabel() -> DetailsBaseLabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite,
                                font: R.Fonts.boldFont(withSize: 18),
                                numberOfLines: 0)
    }
    static func createReleasedMovieYearLabel() -> DetailsBaseLabel {
        return DetailsBaseLabel(textColor: UIColor(hexString: "8C8C8C"),
                                font: R.Fonts.regularFont(withSize: 16))
    }
    static func createGenresLabel() -> DetailsBaseLabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite,
                                font: R.Fonts.regularFont(withSize: 16))
    }
    static func createDetailsMovieOverviewLabel() -> DetailsBaseLabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite,
                                font: R.Fonts.regularFont(withSize: 14), numberOfLines: 0)
    }
    static func createAddToListView() -> DetailsHelpersView {
        return DetailsHelpersView(title: "List",
                                    viewIcon: UIImage(systemName: "bookmark"))
    }
    static func createAverageRatingView() -> DetailsHelpersView {
        return DetailsHelpersView(title: "",
                                  viewIcon: UIImage(systemName: "star"))
    }
    static func createSharedView() -> DetailsHelpersView {
        return DetailsHelpersView(title: "Shared",
                                  viewIcon: UIImage(systemName: "arrowshape.turn.up.forward"))
    }
}
