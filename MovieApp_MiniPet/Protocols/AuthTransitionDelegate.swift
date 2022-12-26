//
//  AuthTransitionDelegate.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 26.12.2022.
//

import Foundation

protocol AuthTransitionDelegate: AnyObject {
    func toLoginVC()
    func toSignUpVC()
}
