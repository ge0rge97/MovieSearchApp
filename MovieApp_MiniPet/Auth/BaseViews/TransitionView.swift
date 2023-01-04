//
//  TransitionView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 26.12.2022.
//

import UIKit

final class TransitionView: UIView {
    
    let transitionLabel = UILabel()
    let transitionButton = UIButton()
    
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
//MARK: - Private Methods
private extension TransitionView {
    func setupViews() {
        [transitionLabel, transitionButton].forEach{ addSubview($0) }
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            transitionLabel.topAnchor.constraint(equalTo: topAnchor),
            transitionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            transitionButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            transitionButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    func configureAppearance() {
        [transitionLabel, transitionButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        transitionLabel.textColor = R.Colors.mainWhite
        transitionLabel.font = R.Fonts.regularFont(withSize: 14)
        
        transitionButton.backgroundColor = .clear
        transitionButton.setTitleColor(UIColor(hexString: "D80526"), for: .normal)
        transitionButton.titleLabel?.font = R.Fonts.regularFont(withSize: 14)
    }
}
