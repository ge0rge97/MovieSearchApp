//
//  AuthTextField.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

final class AuthTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: R.Colors.mainWhite]
        )
        self.backgroundColor = .clear
        self.textColor = R.Colors.mainWhite
        self.layer.borderWidth = 1
        self.layer.borderColor = R.Colors.separator.cgColor
        self.layer.cornerRadius = 10
        self.setLeftPaddingPoints(20)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
