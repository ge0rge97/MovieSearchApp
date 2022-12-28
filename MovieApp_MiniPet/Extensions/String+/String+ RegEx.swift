//
//  String+ RegEx.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 25.12.2022.
//

import Foundation

extension String {
    
    enum ValidType {
        case email
        case password
    }
    enum RegEx: String {
        case email = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        case password = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    }
    func isValid(validType: ValidType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        switch validType {
        case .email:
            regex = RegEx.email.rawValue
        case .password:
            regex = RegEx.password.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
