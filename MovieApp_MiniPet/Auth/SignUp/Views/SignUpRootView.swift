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
        
        self.authButton.setTitle("Sign Up", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
