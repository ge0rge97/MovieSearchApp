//
//  SignUpViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

final class SignUpViewController: BaseViewController<SignUpRootView> {
    
    private var authViewModel: AuthenticationViewModel?
    weak var transitionDelegate: AuthTransitionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authViewModel = AuthenticationViewModel()
        authViewModel?.authOutput = self
        
        setupNavigationTitle()
        setupButtonAction()
    }
}
//MARK: - Private Methods
private extension SignUpViewController {
    
    func setupNavigationTitle() {
        self.navigationItem.title = "SIGN UP"
    }
    func setupButtonAction() {
        mainView.authButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        mainView.googleButton.addTarget(self, action: #selector(googleAuthButtonAction), for: .touchUpInside)
        mainView.transitionView.transitionButton.addTarget(self, action: #selector(transitionButton), for: .touchUpInside)
    }
}
//MARK: - Button Actions
@objc
extension SignUpViewController {
    
    func signUpButtonAction() {
        authViewModel?.signUp(email: mainView.emailTextField.text!, password: mainView.passwordTextField.text!)
    }
    func googleAuthButtonAction() {
        print(#function)
    }
    func transitionButton() {
        dismiss(animated: true) {
            self.transitionDelegate?.toLoginVC()
        }
    }
}
//MARK: - AuthOutput
extension SignUpViewController: AuthOutputProtocol {
    func successAuth(withUser user: MovieUserModel) {
        let tabBar = TabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
    func failAuth(withError error: String) {
        self.getAlertWithError(error: error)
    }
}
