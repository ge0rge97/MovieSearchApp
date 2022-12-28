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
    
    let getDetailsButton = UIButton(type: .system)
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
            
            getDetailsButton.heightAnchor.constraint(equalToConstant: Constants.buttonsHeight),
            
            detailsStackView.topAnchor.constraint(equalTo: detailsMovieImage.bottomAnchor, constant: Constants.stackViewPadding),
            detailsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.stackViewPadding),
            detailsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.stackViewPadding),
        
            helpersStackView.heightAnchor.constraint(equalToConstant: Constants.buttonsHeight)
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
        [detailsMoveTitle, releasedMovieYearLabel, genresLabel, detailsMovieOverviewLabel, getDetailsButton, helpersStackView].forEach{ detailsStackView.addArrangedSubview($0) }
        [detailsMovieImage, detailsStackView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        [detailsStackView, detailsMovieImage, getDetailsButton, helpersStackView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        detailsStackView.axis = .vertical
        detailsStackView.distribution = .fill
        detailsStackView.spacing = Constants.stackViewSpacing
        
        helpersStackView.distribution = .fillEqually
        
        getDetailsButton.backgroundColor = R.Colors.mainWhite
        getDetailsButton.setTitle(R.Strings.Details.movieDetailsButtonTitle, for: .normal)
        getDetailsButton.setTitleColor(.black, for: .normal)
        getDetailsButton.layer.cornerRadius = 10
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
        return DetailsBaseLabel(textColor: R.Colors.createdYearColor,
                                font: R.Fonts.regularFont(withSize: 16))
    }
    static func createGenresLabel() -> DetailsBaseLabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite,
                                font: R.Fonts.regularFont(withSize: 16))
    }
    static func createDetailsMovieOverviewLabel() -> DetailsBaseLabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite,
                                font: R.Fonts.regularFont(withSize: 14), numberOfLines: 3)
    }
    static func createAddToListView() -> DetailsHelpersView {
        return DetailsHelpersView(title: R.Strings.Details.addToListViewTitle,
                                  viewIcon: R.Images.addToListViewImage)
    }
    static func createAverageRatingView() -> DetailsHelpersView {
        return DetailsHelpersView(title: "",
                                  viewIcon: R.Images.averageRatingViewImage)
    }
    static func createSharedView() -> DetailsHelpersView {
        return DetailsHelpersView(title: R.Strings.Details.sharedViewTitle,
                                  viewIcon: R.Images.sharedViewImage)
    }
}
//MARK: - Constants
extension DetailsRootView {
    private enum Constants {
        static let buttonsHeight: CGFloat = 60
        static let stackViewPadding: CGFloat = 10
        static let stackViewSpacing: CGFloat = 14
    }
}
