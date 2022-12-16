//
//  AuthButton.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

final class AuthButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppearance()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension AuthButton {
    
    func configureAppearance() {
        
        self.backgroundColor = R.Colors.baseButtonColor
        self.setTitleColor(R.Colors.mainBackground, for: .normal)
        self.titleLabel?.font = R.Fonts.boldFont(withSize: 22)
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
