//
//  StartViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class StartViewController: BaseViewController<StartRootView> {
    
    private let signUpVC = SignUpViewController()
    private let loginVC = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpVC.transitionDelegate = self
        loginVC.transitionDelegate = self
        setupButtonAction()
    }
}
//MARK: - Private Methods
private extension StartViewController {
    
    func setupButtonAction() {
        mainView.loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        mainView.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
    }
    func setupLoginVC() {
        let navLoginVC = BaseNavigationController(rootViewController: loginVC)
        present(navLoginVC, animated: true)
    }
    func setupSignUpVC() {
        let navLoginVC = BaseNavigationController(rootViewController: signUpVC)
        present(navLoginVC, animated: true)
    }
}
//MARK: - Buttons Action
@objc
private extension StartViewController {
    
    func loginButtonAction() {
        self.setupLoginVC()
    }
    func signUpButtonAction() {
        self.setupSignUpVC()
    }
}
//MARK: - Transition Delegate
extension StartViewController: AuthTransitionDelegate {
    func toLoginVC() {
        self.setupLoginVC()
    }
    func toSignUpVC() {
        self.setupSignUpVC()
    }
}
