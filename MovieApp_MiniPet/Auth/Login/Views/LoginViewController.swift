//
//  LoginViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

final class LoginViewController: BaseViewController<LoginRootView> {
    
    private var authViewModel: AuthenticationViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authViewModel = AuthenticationViewModel()
        authViewModel?.authOutput = self
        
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
        authViewModel?.login(email: mainView.emailTextField.text!, password: mainView.passwordTextField.text!)
    }
    func googleAuthButtonAction() {
        print(#function)
    }
}
//MARK: - AuthOutput
extension LoginViewController: AuthOutputProtocol {
    func successAuth(withUser user: MovieUserModel) {
        print(user.email)
        
        let tabBar = TabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
    func failAuth(withError error: String) {
        self.getAlertWithError(error: error)
    }
}
