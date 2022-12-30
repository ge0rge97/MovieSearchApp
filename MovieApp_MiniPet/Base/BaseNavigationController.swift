//
//  BaseNavigationController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}
//MARK: - Private Methods
private extension BaseNavigationController {
    
    func configureAppearance() {
        
        view.backgroundColor = R.Colors.mainBackground
        navigationBar.isTranslucent = true
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = R.Colors.mainBackground
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: R.Colors.mainWhite,
            .font: R.Fonts.boldFont(withSize: 20) ?? .boldSystemFont(ofSize: 20)
        ]
        
        UIBarButtonItem.appearance().tintColor = R.Colors.baseButtonColor
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: R.Fonts.boldFont(withSize: 16) ?? .systemFont(ofSize: 16)
        ], for: .normal)
    }
}
