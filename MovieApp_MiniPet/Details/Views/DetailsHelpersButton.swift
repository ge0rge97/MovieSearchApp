//
//  DetailsHelpersButton.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 18.12.2022.
//

import UIKit

final class DetailsHelpersButton: UIButton {
    
    private let buttonTitleLabel = UILabel()
    private let buttonIcon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(title: String, buttonIcon: UIImage?) {
        self.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        configureAppearance()
        
        self.buttonTitleLabel.text = title
        self.buttonIcon.image = buttonIcon
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private Methods
private extension DetailsHelpersButton {
    
    func setupViews() {
        [buttonTitleLabel, buttonIcon].forEach{ addSubview($0) }
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonIcon.topAnchor.constraint(equalTo: topAnchor),
            buttonIcon.heightAnchor.constraint(equalToConstant: 30),
            buttonIcon.widthAnchor.constraint(equalToConstant: 30),
            
            buttonTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    func configureAppearance() {
        [buttonTitleLabel, buttonIcon].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        self.backgroundColor = .clear
        
        buttonTitleLabel.textColor = R.Colors.mainWhite
        buttonTitleLabel.font = R.Fonts.regularFont(withSize: 14)
        
        buttonIcon.tintColor = R.Colors.mainWhite
    }
}
