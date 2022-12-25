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
            noInternetConnectionImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            noInternetConnectionImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            noInternetConnectionImage.heightAnchor.constraint(equalTo: noInternetConnectionImage.widthAnchor),
            
            noInternetConnectionLabel.bottomAnchor.constraint(equalTo: noInternetConnectionImage.topAnchor, constant: -20),
            noInternetConnectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            noInternetConnectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
    func configureAppearance() {
        [noInternetConnectionLabel, noInternetConnectionImage].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        noInternetConnectionLabel.text = "There's no Internet connection..."
        noInternetConnectionLabel.textColor = R.Colors.baseButtonColor
        noInternetConnectionLabel.font = R.Fonts.boldFont(withSize: 18)
        noInternetConnectionLabel.textAlignment = .center
        
        noInternetConnectionImage.image = UIImage(named: "noInternetConnectionImage")
        noInternetConnectionImage.backgroundColor = R.Colors.baseButtonColor
        noInternetConnectionImage.layer.cornerRadius = 10
    }
}
