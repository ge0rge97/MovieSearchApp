//
//  OrView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

final class OrView: UIView {
    
    private let orLabel = UILabel()
    private let leftLineView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let rightLineView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        configureAppearance()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Required Methods
extension OrView {
    func setupViews() {
        [orLabel, leftLineView, rightLineView].forEach{ addSubview($0) }
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            orLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            orLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            leftLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            leftLineView.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -10),
            leftLineView.heightAnchor.constraint(equalToConstant: 1),
            leftLineView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            
            rightLineView.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 10),
            rightLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            rightLineView.heightAnchor.constraint(equalToConstant: 1),
            rightLineView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor)
        ])
    }
    func configureAppearance() {
        [orLabel, leftLineView, rightLineView, self].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        leftLineView.backgroundColor = R.Colors.mainWhite
        rightLineView.backgroundColor = R.Colors.mainWhite
        
        orLabel.text = "OR"
        orLabel.textColor = R.Colors.mainWhite
        orLabel.font = R.Fonts.regularFont(withSize: 20)
    }
}
