//
//  BaseView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

class BaseView: UIView {
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
//MARK: - Inherited Methods
extension BaseView {
    @objc func setupViews() {}
    @objc func setupConstraints() {}
    @objc func configureAppearance() {
        self.backgroundColor = R.Colors.mainBackground
    }
}
