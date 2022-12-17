//
//  AuthBaseView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

class AuthBaseView: BaseView {
    
    let emailTextField = AuthTextField(placeholder: "Enter Your Email")
    let passwordTextField = AuthTextField(placeholder: "Enter Your Password")
    
    let authButton = AuthButton()
    let googleButton = GoogleAuthButton()

    private let orView = OrView()
    private let mainStackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.mainStackViewTopPadding),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.mainPadding),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.mainPadding),
            mainStackView.heightAnchor.constraint(equalToConstant: self.bounds.height / 4),
            
            orView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 40),
            orView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.mainPadding),
            orView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.mainPadding),
            orView.heightAnchor.constraint(equalToConstant: 20),
            
            googleButton.topAnchor.constraint(equalTo: orView.bottomAnchor, constant: 40),
            googleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.mainPadding),
            googleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.mainPadding),
            googleButton.heightAnchor.constraint(equalTo: authButton.heightAnchor),
        ])
    }
}
//MARK: - Required Methods
extension AuthBaseView {
    
    override func setupViews() {
        [emailTextField, passwordTextField, authButton].forEach{ mainStackView.addArrangedSubview($0) }
        [mainStackView, googleButton, orView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        [mainStackView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 20
    }
}
//MARK: - Constants
extension AuthBaseView {
    
    private enum Constants {
        static let mainPadding: CGFloat = 20
        static let mainStackViewTopPadding: CGFloat = 100
    }
}
