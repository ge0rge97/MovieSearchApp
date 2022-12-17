//
//  SignUpViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

final class SignUpViewController: BaseViewController<SignUpRootView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
}
//MARK: - Button Actions
@objc
private extension SignUpViewController {
    
    func signUpButtonAction() {
        print(#function)
    }
    func googleAuthButtonAction() {
        print(#function)
    }
}
