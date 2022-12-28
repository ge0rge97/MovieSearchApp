//
//  NoInternetConnectionView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 25.12.2022.
//

import UIKit

final class NoInternetConnectionView: UIView {
    
    private let noInternetConnectionLabel = UILabel()
    private let noInternetConnectionImage = UIImageView()
    
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
private extension NoInternetConnectionView {
    
    func setupViews() {
        [noInternetConnectionLabel, noInternetConnectionImage].forEach{ addSubview($0) }
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            noInternetConnectionImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            noInternetConnectionImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.imageSpacing),
            noInternetConnectionImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.imageSpacing),
            noInternetConnectionImage.heightAnchor.constraint(equalTo: noInternetConnectionImage.widthAnchor),
            
            noInternetConnectionLabel.bottomAnchor.constraint(equalTo: noInternetConnectionImage.topAnchor, constant: -Constants.labelSpacing),
            noInternetConnectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.labelSpacing),
            noInternetConnectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.labelSpacing),
        ])
    }
    func configureAppearance() {
        [noInternetConnectionLabel, noInternetConnectionImage].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        noInternetConnectionLabel.text = R.Strings.Home.noInternetConnectionViewTitle
        noInternetConnectionLabel.textColor = R.Colors.baseButtonColor
        noInternetConnectionLabel.font = R.Fonts.boldFont(withSize: 18)
        noInternetConnectionLabel.textAlignment = .center
        
        noInternetConnectionImage.image = R.Images.noInternetConnectionViewImage
        noInternetConnectionImage.backgroundColor = R.Colors.baseButtonColor
        noInternetConnectionImage.layer.cornerRadius = 10
    }
}
//MARK: - Constants
extension NoInternetConnectionView {
    private enum Constants {
        static let imageSpacing: CGFloat = 50
        static let labelSpacing: CGFloat = 20
    }
}
