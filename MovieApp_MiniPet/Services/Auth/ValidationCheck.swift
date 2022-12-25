//
//  ValidationCheck.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 25.12.2022.
//

import Foundation

class ValidationCheck {
    
    func isFilledAuthentication(email: String?, password: String?) -> Bool {
        guard let email = email, let password = password,
              email != "", password != "" else { return false }
        return true
    }
    func isValidAuthentication(email: String?, password: String?) -> Bool {
        guard isFilledAuthentication(email: email, password: password),
              email!.isValid(validType: .email), password!.isValid(validType: .password) else { return false }
        return true
    }
}
