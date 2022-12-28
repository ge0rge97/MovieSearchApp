//
//  TrendingMovieCollectionViewCell.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit
import SDWebImage

final class TrendingMovieCollectionViewCell: BaseCollectionViewMovieCell {
    
    static let reuseId: String = R.CellIds.trendingMovieCollectionViewCell
    let savedButton = UIButton()
    
    weak var cellViewModel: DetailMovieViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            
            let url = URL(string: "\(R.StringURLs.movieDatabaseImage)\(viewModel.imageName)")
            movieCellImage.sd_setImage(with: url)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        configureAppearance()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private Methods
extension TrendingMovieCollectionViewCell {
    
    func setupViews() {
        [savedButton].forEach{ addSubview($0) }
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            savedButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.savedButtonSpacing),
            savedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.savedButtonSpacing),
            savedButton.widthAnchor.constraint(equalToConstant: Constants.savedButtonSize),
            savedButton.heightAnchor.constraint(equalToConstant: Constants.savedButtonSize),
        ])
    }
    func configureAppearance() {
        [savedButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        savedButton.setBackgroundImage(R.Images.saveButtonImage, for: .normal)
        savedButton.tintColor = R.Colors.baseButtonColor
    }
}
//MARK: - Constants
extension TrendingMovieCollectionViewCell {
    private enum Constants {
        static let savedButtonSize: CGFloat = 26
        static let savedButtonSpacing: CGFloat = 10
    }
}
