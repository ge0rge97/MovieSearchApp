//
//  SignUpRootView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

final class SignUpRootView: AuthBaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.authButton.setTitle(R.Strings.Auth.signUpTitle, for: .normal)
        self.transitionView.transitionLabel.text = R.Strings.Auth.signUpTransition
        self.transitionView.transitionButton.setTitle(R.Strings.Auth.loginTitle, for: .normal)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
