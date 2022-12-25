//
//  LoginAuthService.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 25.12.2022.
//

import Foundation
import FirebaseAuth

class LoginAuthService {
    static var shared = LoginAuthService() //Singleton
    private let auth = Auth.auth() //Init Firestore Auth
    
    let validationCheck = ValidationCheck()
    
    func login(email: String?, password: String?, completion: @escaping (Swift.Result<User, AuthError>) -> Void) {
        guard validationCheck.isFilledAuthentication(email: email, password: password) else {
            completion(.failure(AuthError.notFilled))
            return
        }
        guard validationCheck.isValidAuthentication(email: email, password: password) else {
            completion(.failure(AuthError.invalidFormat))
            return
        }
        auth.signIn(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                completion(.failure(.wrongEmailOrPassword))
                return
            }
            completion(.success(result.user))
        }
    } //Login User
    //    func logOut(viewController: BaseViewController) {
    //        do {
    //            try Auth.auth().signOut()
    //            viewController.modalPresentationStyle = .fullScreen
    //            UIApplication.getTopViewController()?.present(viewController, animated: true)
    //        } catch let error as NSError {
    //            print(error.localizedDescription)
    //        }
    //    } //LogOut
}
