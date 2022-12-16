//
//  LoginViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

final class LoginViewController: BaseViewController<LoginRootView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationTitle()
        setupButtonAction()
    }
}
//MARK: - Private Methods
private extension LoginViewController {
    
    func setupNavigationTitle() {
        
        self.navigationItem.title = "LOGIN"
    }
    func setupButtonAction() {
        
        mainView.authButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        mainView.googleButton.addTarget(self, action: #selector(googleAuthButtonAction), for: .touchUpInside)
    }
}
//MARK: - Button Actions
@objc
private extension LoginViewController {
    
    func loginButtonAction() {
        print(#function)
    }
    func googleAuthButtonAction() {
        print(#function)
    }
}
