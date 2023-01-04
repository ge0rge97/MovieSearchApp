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
        configureAppearance()
    }
    override func updateConstraints() {
        super.updateConstraints()
        setupContraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Inherited Methods
extension BaseView {
    @objc func setupViews() {}
    @objc func setupContraints() {}
    @objc func configureAppearance() {
        self.backgroundColor = R.Colors.mainBackground
    }
}
