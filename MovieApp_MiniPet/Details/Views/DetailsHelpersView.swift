//
//  DetailsHelpersView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 18.12.2022.
//

import UIKit

final class DetailsHelpersView: UIView {
    
    let titleLabel = UILabel()
    private let viewIcon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(title: String, viewIcon: UIImage?) {
        self.init(frame: .zero)
        setupViews()
        setupConstraints()
        configureAppearance()
        
        self.titleLabel.text = title
        self.viewIcon.image = viewIcon
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setTitleIfNeeded(_ title: String) {
        titleLabel.text = title
    }
}
//MARK: - Private Methods
private extension DetailsHelpersView {
    
    func setupViews() {
        [titleLabel, viewIcon].forEach{ addSubview($0) }
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            viewIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewIcon.topAnchor.constraint(equalTo: topAnchor),
            viewIcon.heightAnchor.constraint(equalToConstant: 26),
            viewIcon.widthAnchor.constraint(equalToConstant: 26),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    func configureAppearance() {
        [titleLabel, viewIcon].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        self.backgroundColor = .clear
        
        titleLabel.textColor = R.Colors.mainWhite
        titleLabel.font = R.Fonts.regularFont(withSize: 14)
        
        viewIcon.tintColor = R.Colors.mainWhite
    }
}
