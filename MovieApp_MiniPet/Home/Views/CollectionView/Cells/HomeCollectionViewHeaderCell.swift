//
//  HomeCollectionViewHeaderCell.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class HomeCollectionViewHeaderCell: UICollectionReusableView {
    
    static let reuseId = R.CellIds.homeCollectionViewHeaderCell
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        configureAppearance()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureTitle(title: String) {
        titleLabel.text = title
    }
}
//MARK: - Required Methods
private extension HomeCollectionViewHeaderCell {
    
    func setupViews() {
        [titleLabel].forEach{ addSubview($0) }
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    func configureAppearance() {
        [titleLabel].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        titleLabel.textColor = R.Colors.mainWhite
        titleLabel.font = R.Fonts.boldFont(withSize: 20)
    }
}
