//
//  AuthBaseView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

class AuthBaseView: BaseView {
    
    let emailTextField = AuthTextField(placeholder: R.Strings.Auth.emailTextFieldText)
    let passwordTextField = AuthTextField(placeholder: R.Strings.Auth.passwordTextFieldText)

    let authButton = AuthButton()

    let transitionView = TransitionView()
    private let orView = OrView()
    private let mainStackView = UIStackView()
}
//MARK: - Required Methods
extension AuthBaseView {
    
    override func setupViews() {
        [emailTextField, passwordTextField, authButton].forEach{ mainStackView.addArrangedSubview($0) }
        [mainStackView, orView, transitionView].forEach{ addSubview($0) }
    }
    override func setupContraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.mainStackViewTopPadding),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.mainPadding),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.mainPadding),
            mainStackView.heightAnchor.constraint(equalToConstant: self.bounds.height / 4),
            
            orView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 40),
            orView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.mainPadding),
            orView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.mainPadding),
            orView.heightAnchor.constraint(equalToConstant: 20),
            
            transitionView.topAnchor.constraint(equalTo: orView.bottomAnchor, constant: 30),
            transitionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            transitionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            transitionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        [mainStackView, transitionView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
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
