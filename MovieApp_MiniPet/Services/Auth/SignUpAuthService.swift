//
//  SignUpAuthService.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 25.12.2022.
//

import FirebaseAuth

class SignUpAuthService {
    static var shared = SignUpAuthService()
    private let auth = Auth.auth()
    private let validationCheck = ValidationCheck()
    
    func signUp(email: String?, password: String?, completion: @escaping (Swift.Result<User, AuthError>) -> Void) {
        guard validationCheck.isFilledAuthentication(email: email, password: password) else {
            completion(.failure(AuthError.notFilled))
            return
        }
        guard validationCheck.isValidAuthentication(email: email, password: password) else {
            completion(.failure(AuthError.invalidFormat))
            return
        }
        auth.createUser(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                completion(.failure(.serverError))
                return
            }
            completion(.success(result.user))
        }
    }
}
