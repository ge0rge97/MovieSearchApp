//
//  StartViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class StartViewController: BaseViewController<StartRootView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonAction()
    }
}
//MARK: - Private Methods
private extension StartViewController {
    
    func setupButtonAction() {
        
        mainView.loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        mainView.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
    }
}
//MARK: - Buttons Action
@objc
private extension StartViewController {
    
    func loginButtonAction() {
        let loginVC = LoginViewController()
        let navLoginVC = BaseNavigationController(rootViewController: loginVC)
        present(navLoginVC, animated: true)
    }
    func signUpButtonAction() {
        let signUpVC = SignUpViewController()
        let navSignUpVC = BaseNavigationController(rootViewController: signUpVC)
        present(navSignUpVC, animated: true)
    }
}
