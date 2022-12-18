//
//  DetailsViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 18.12.2022.
//

import UIKit

final class DetailsViewController: BaseViewController<DetailsRootView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonActions()
    }
}
//MARK: - Private Methods
private extension DetailsViewController {
    
    func setupButtonActions() {
        
        mainView.watchNowButton.addTarget(self, action: #selector(watchNowButtonAction), for: .touchUpInside)
        mainView.addToListButton.addTarget(self, action: #selector(addToListButtonAction), for: .touchUpInside)
        mainView.sharedButton.addTarget(self, action: #selector(sharedButtonAction), for: .touchUpInside)
    }
}
//MARK: - Buttons Action
@objc
private extension DetailsViewController {
    
    func watchNowButtonAction() {
        print(#function)
    }
    func addToListButtonAction() {
        print(#function)
    }
    func sharedButtonAction() {
        print(#function)
    }
}
