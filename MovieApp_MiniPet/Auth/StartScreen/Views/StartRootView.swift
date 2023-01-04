//
//  StartRootView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class StartRootView: BaseView {
    
    private let mainBackgroundImage = UIImageView()
    let loginButton = AuthButton()
    let signUpButton = AuthButton()
    private let stackView = UIStackView()
}
//MARK: - Required Methods
extension StartRootView {
    override func setupViews() {
        [loginButton, signUpButton].forEach{ stackView.addArrangedSubview($0) }
        [mainBackgroundImage, stackView].forEach{ addSubview($0) }
    }
    override func setupContraints() {
        NSLayoutConstraint.activate([
            mainBackgroundImage.widthAnchor.constraint(equalTo: widthAnchor),
            mainBackgroundImage.heightAnchor.constraint(equalTo: heightAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: (Constants.buttonHeight * 2) + (Constants.stackViewSpacing * 2)),
            stackView.widthAnchor.constraint(equalToConstant: self.bounds.width - (Constants.mainSpacing * 2))
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        [mainBackgroundImage, stackView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false}
        self.backgroundColor = R.Colors.mainWhite
        
        mainBackgroundImage.image = R.Images.startScreenBackgroundImage
        mainBackgroundImage.contentMode = .scaleAspectFill
        
        loginButton.setTitle(R.Strings.Auth.loginTitle, for: .normal)
        signUpButton.setTitle(R.Strings.Auth.signUpTitle, for: .normal)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.stackViewSpacing
    }
}
//MARK: - Constants
extension StartRootView {
    private enum Constants {
        
        static let buttonHeight: CGFloat = 40
        static let mainSpacing: CGFloat = 20
        static let stackViewSpacing:CGFloat = 20
    }
}
