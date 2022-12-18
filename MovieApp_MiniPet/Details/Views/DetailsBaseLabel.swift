//
//  DetailsBaseLabel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 18.12.2022.
//

import UIKit

final class DetailsBaseLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(textColor: UIColor, font: UIFont?, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.configureAppearance(textColor: textColor, font: font, numberOfLines: numberOfLines)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private Methods
private extension DetailsBaseLabel {
    
    func configureAppearance(textColor: UIColor, font: UIFont?, numberOfLines: Int = 1) {
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines
    }
}
