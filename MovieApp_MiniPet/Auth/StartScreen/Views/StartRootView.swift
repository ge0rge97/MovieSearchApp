//
//  StartRootView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class StartRootView: BaseView {
    
    let loginButton = AuthButton()
    let signUpButton = AuthButton()
    
    private let stackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: (Constants.buttonHeight * 2) + (Constants.stackViewSpacing * 2)),
            stackView.widthAnchor.constraint(equalToConstant: self.bounds.width - (Constants.mainSpacing * 2))
        ])
    }
}
//MARK: - Required Methods
extension StartRootView {
    
    override func setupViews() {
        [loginButton, signUpButton].forEach{ stackView.addArrangedSubview($0) }
        [stackView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        [stackView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false}
        
        self.backgroundColor = .white
        
        loginButton.setTitle("LOGIN", for: .normal)
        signUpButton.setTitle("SIGN UP", for: .normal)
        
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
