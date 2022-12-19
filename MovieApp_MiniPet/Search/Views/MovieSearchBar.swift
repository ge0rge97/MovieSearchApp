//
//  MovieSearchBar.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 19.12.2022.
//

import UIKit

final class MovieSearchBar: UISearchBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init() {
        self.init(frame: .zero)
        configureAppearance()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private Methods
private extension MovieSearchBar {
    
    func configureAppearance() {
        self.barTintColor = UIColor(hexString: "3C3C3C")
        self.tintColor = R.Colors.separator
        self.searchTextField.textColor = R.Colors.mainWhite
        self.placeholder = "Search your favourite movie"
    }
}
