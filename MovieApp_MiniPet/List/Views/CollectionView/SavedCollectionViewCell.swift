//
//  SavedCollectionViewCell.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 19.12.2022.
//

import UIKit

final class SavedCollectionViewCell: BaseCollectionViewMovieCell {
    
    static let reuseId = "savedCollectionViewCell"
    let removedButton = UIButton()
    
    weak var cellViewModel: DetailMovieViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            
            let url = URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.imageName)")
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
private extension SavedCollectionViewCell {
    
    func setupViews() {
        [removedButton].forEach{ addSubview($0) }
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            removedButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            removedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            removedButton.widthAnchor.constraint(equalToConstant: 26),
            removedButton.heightAnchor.constraint(equalToConstant: 26),
        ])
    }
    func configureAppearance() {
        [removedButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        removedButton.setBackgroundImage(UIImage(systemName: "trash.fill"), for: .normal)
        removedButton.tintColor = R.Colors.baseButtonColor
    }
}
