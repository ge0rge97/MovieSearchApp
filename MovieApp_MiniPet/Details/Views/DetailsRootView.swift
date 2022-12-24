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
    lazy var averageRatingButton = createAverageRatingButton()
    let sharedButton = DetailsRootView.createSharedButton()
    
    var rating: String?
    
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
}
//MARK: - Required Methods
extension DetailsRootView {
    
    override func setupViews() {
        [addToListButton, averageRatingButton, sharedButton].forEach{ helpersStackView.addArrangedSubview($0) }
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
    
    static func createDetailsMoveTitleLabel() -> UILabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite,
                                font: R.Fonts.boldFont(withSize: 18),
                                numberOfLines: 0)
    }
    static func createReleasedMovieYearLabel() -> UILabel {
        return DetailsBaseLabel(textColor: UIColor(hexString: "8C8C8C"),
                                font: R.Fonts.regularFont(withSize: 16))
    }
    static func createGenresLabel() -> UILabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite,
                                font: R.Fonts.regularFont(withSize: 16))
    }
    static func createDetailsMovieOverviewLabel() -> UILabel {
        return DetailsBaseLabel(textColor: R.Colors.mainWhite,
                                font: R.Fonts.regularFont(withSize: 14), numberOfLines: 0)
    }
    static func createAddToListButton() -> UIButton {
        return DetailsHelpersButton(title: "List",
                                    buttonIcon: UIImage(systemName: "bookmark"))
    }
    func createAverageRatingButton() -> UIButton {
        return DetailsHelpersButton(title: rating ?? "",
                                    buttonIcon: UIImage(systemName: "star"))
    }
    static func createSharedButton() -> UIButton {
        return DetailsHelpersButton(title: "Shared",
                                    buttonIcon: UIImage(systemName: "arrowshape.turn.up.forward"))
    }
}
