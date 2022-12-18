//
//  BaseCollectionViewMovieCell.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

class BaseCollectionViewMovieCell: UICollectionViewCell {
    
    let movieCellImage = UIImageView()
    
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
private extension BaseCollectionViewMovieCell {
    
    func setupViews() {
        [movieCellImage].forEach{ addSubview($0) }
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            movieCellImage.topAnchor.constraint(equalTo: topAnchor),
            movieCellImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieCellImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            movieCellImage.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    func configureAppearance() {
        [movieCellImage].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
