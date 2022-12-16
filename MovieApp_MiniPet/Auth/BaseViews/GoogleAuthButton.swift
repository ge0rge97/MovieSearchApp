//
//  GoogleAuthButton.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

final class GoogleAuthButton: UIButton {
    private let labelTitle = UILabel()
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        constraintsViews()
        configure()
    }
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
}
private extension GoogleAuthButton {
    func addViews() {
        [labelTitle, iconView].forEach{addSubview($0)}
    }
    func constraintsViews() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            iconView.widthAnchor.constraint(equalToConstant: 20),
            iconView.heightAnchor.constraint(equalToConstant: 20),
            
            labelTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelTitle.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 6)
        ])
    }
    func configure() {
        [labelTitle, iconView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(hexString: "D80526")
        
        labelTitle.font = R.Fonts.boldFont(withSize: 20)
        labelTitle.text = "Continue with Google"
        labelTitle.textColor = R.Colors.mainWhite
        
        iconView.image = UIImage(named: "googleIcon")?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = R.Colors.mainWhite
    }
}
