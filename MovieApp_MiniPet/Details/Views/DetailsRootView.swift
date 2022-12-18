//
//  DetailsRootView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 18.12.2022.
//

import UIKit

final class DetailsRootView: BaseView {
    
    let detailsMovieImage = UIImageView()
    
    let detailsMoveTitle = DetailsRootView.createDetailsMoveTitleLabel()
    let releasedMovieYearLabel = DetailsRootView.createReleasedMovieYearLabel()
    let genresLabel = DetailsRootView.createGenresLabel()
    let detailsMovieOverviewLabel = DetailsRootView.createDetailsMovieOverviewLabel()
    
    let watchNowButton = UIButton(type: .system)
    
    let addToListButton = DetailsRootView.createAddToListButton()
    let averageRatingButton = DetailsRootView.createAverageRatingButton()
    let sharedButton = DetailsRootView.createSharedButton()
    
    private let helpersStackView = UIStackView()
    
    private let detailsStackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            detailsMovieImage.topAnchor.constraint(equalTo: topAnchor),
            detailsMovieImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailsMovieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailsMovieImage.heightAnchor.constraint(equalToConstant: self.bounds.height / 3),
            
            watchNowButton.heightAnchor.constraint(equalToConstant: 60),
            
            detailsStackView.topAnchor.constraint(equalTo: detailsMovieImage.bottomAnchor, constant: 10),
            detailsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            detailsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            detailsStackView.heightAnchor.constraint(equalToConstant: 400),
        
            helpersStackView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
//MARK: - Required Methods
extension DetailsRootView {
    
    override func setupViews() {
        [addToListButton, averageRatingButton, sharedButton].forEach{ helpersStackView.addArrangedSubview($0) }
        [detailsMoveTitle, releasedMovieYearLabel, genresLabel, watchNowButton, detailsMovieOverviewLabel,helpersStackView].forEach{ detailsStackView.addArrangedSubview($0) }
        [detailsMovieImage, detailsStackView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        [detailsMovieImage, detailsStackView, watchNowButton, helpersStackView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        detailsMovieImage.backgroundColor = .purple
        
        detailsStackView.axis = .vertical
        detailsStackView.distribution = .fillProportionally
        detailsStackView.spacing = 10
        detailsStackView.layer.borderWidth = 1
        detailsStackView.layer.borderColor = UIColor.blue.cgColor
        
        helpersStackView.distribution = .fillEqually
        
        detailsMoveTitle.text = "Test Title"
        releasedMovieYearLabel.text = "1997"
        genresLabel.text = "Actions . Adventure . Drama"
        detailsMovieOverviewLabel.text = "Text Overview Text Overview Text Overview Text Overview Text Overview Text Overview Text Overview Text Overview Text Overview Text Overview Text Overview Text Overview "
        
        watchNowButton.backgroundColor = R.Colors.mainWhite
        watchNowButton.setTitle("Watch Now", for: .normal)
        watchNowButton.setTitleColor(.black, for: .normal)
        watchNowButton.layer.cornerRadius = 10
    }
}
//MARK: - Private Create Methods
private extension DetailsRootView {
    
    static func createDetailsMoveTitleLabel() -> UILabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite, font: R.Fonts.boldFont(withSize: 22))
    }
    static func createReleasedMovieYearLabel() -> UILabel {
        return DetailsBaseLabel(textColor: R.Colors.separator, font: R.Fonts.regularFont(withSize: 18))
    }
    static func createGenresLabel() -> UILabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite, font: R.Fonts.regularFont(withSize: 20))
    }
    static func createDetailsMovieOverviewLabel() -> UILabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite, font: R.Fonts.regularFont(withSize: 16), numberOfLines: 0)
    }
    static func createAddToListButton() -> UIButton {
        return DetailsHelpersButton(title: "List", buttonIcon: UIImage(systemName: "bookmark"))
    }
    static func createAverageRatingButton() -> UIButton {
        return DetailsHelpersButton(title: "8.3", buttonIcon: UIImage(systemName: "star"))
    }
    static func createSharedButton() -> UIButton {
        return DetailsHelpersButton(title: "Shared", buttonIcon: UIImage(systemName: "arrowshape.turn.up.forward"))
    }
}
