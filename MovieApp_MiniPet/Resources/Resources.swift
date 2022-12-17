//
//  Resources.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

typealias R = Resources

enum Resources {
    //MARK: - Colors
    enum Colors {
        
        static let mainBackground: UIColor = UIColor(hexString: "151111")
        static let separator: UIColor = UIColor(hexString: "3C3C3C")
        static let baseButtonColor: UIColor = UIColor(hexString: "F9CF32")
        static let mainWhite: UIColor = UIColor(hexString: "FCFCFC")
    }
}
//MARK: - Fonts
extension Resources {
    enum Fonts {
        
        static func regularFont(withSize size: CGFloat) -> UIFont? {
            return UIFont(name: "Georgia", size: size)
        } //MARK: - Regular (Georgia)
        static func boldFont(withSize size: CGFloat) -> UIFont? {
            return UIFont(name: "Georgia-Bold", size: size)
        } //MARK: - Regular (Georgia)
    }
}

