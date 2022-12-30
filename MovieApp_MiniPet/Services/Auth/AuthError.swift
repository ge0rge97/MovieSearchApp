//
//  AuthError.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 25.12.2022.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidFormat
    case unknownError
    case serverError
    case wrongEmailOrPassword
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Filled in all fields.", comment: "") //Error - not all fields filled
        case .unknownError:
            return NSLocalizedString("Sorry, unknown error:(", comment: "") //Error - unknown
        case .serverError:
            return NSLocalizedString("Server doesn't work, please try later.", comment: "") //Error - server
        case .invalidFormat:
            return NSLocalizedString("Enter correct data format (Password 8 char, min 1 upper.letter and number).", comment: "") //Error - invalid format
        case .wrongEmailOrPassword:
            return NSLocalizedString("Wrong Email or Password.", comment: "") //Error - wrongEmailOrPassword
        }
    }
}
