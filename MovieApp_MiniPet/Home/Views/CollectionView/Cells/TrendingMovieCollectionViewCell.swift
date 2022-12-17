//
//  TrendingMovieCollectionViewCell.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class TrendingMovieCollectionViewCell: BaseCollectionViewMovieCell {
    
    let savedButton = UIButton()
    
    static let reuseId: String = "trendingMovieCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        movieCellImage.backgroundColor = .green
        
        setupViews()
        setupConstraints()
        configureAppearance()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Override Methods
extension TrendingMovieCollectionViewCell {
    
    func setupViews() {
        [savedButton].forEach{ addSubview($0) }
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            savedButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            savedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            savedButton.widthAnchor.constraint(equalToConstant: 26),
            savedButton.heightAnchor.constraint(equalToConstant: 26),
        ])
    }
    func configureAppearance() {
        [savedButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        savedButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        savedButton.tintColor = R.Colors.baseButtonColor
    }
}
