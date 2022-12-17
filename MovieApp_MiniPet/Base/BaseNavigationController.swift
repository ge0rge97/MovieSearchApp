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
    
    private func configureAppearance() {
        
        view.backgroundColor = R.Colors.mainBackground
        navigationBar.isTranslucent = false
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = R.Colors.mainBackground
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: R.Colors.mainWhite,
            .font: R.Fonts.boldFont(withSize: 24) ?? .boldSystemFont(ofSize: 24)
        ]
    }
}