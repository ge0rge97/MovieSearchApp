//
//  AuthenticationViewModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 25.12.2022.
//

import Foundation

protocol AuthOutputProtocol: AnyObject {
    
    func successAuth(withUser user: MovieUserModel)
    func failAuth(withError error: String)
}

class AuthenticationViewModel {
    
    weak var authOutput: AuthOutputProtocol?
    
    func signUp(email: String, password: String) {
        SignUpAuthService.shared.signUp(email: email, password: password) { result in
            switch result {
            case .success(let user):
                let currentUser = MovieUserModel(email: user.email!, userId: user.uid)
                self.authOutput?.successAuth(withUser: currentUser)
            case .failure(let error):
                self.authOutput?.failAuth(withError: error.localizedDescription)
            }
        }
    }
    func login(email: String, password: String) {
        LoginAuthService.shared.login(email: email, password: password) { result in
            switch result {
            case .success(let user):
                let currentUser = MovieUserModel(email: user.email!, userId: user.uid)
                self.authOutput?.successAuth(withUser: currentUser)
            case .failure(let error):
                self.authOutput?.failAuth(withError: error.localizedDescription)
            }
        }
    }
}
