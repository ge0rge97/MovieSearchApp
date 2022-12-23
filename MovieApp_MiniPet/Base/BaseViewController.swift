//
//  BaseViewController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

class BaseViewController<View: UIView>: UIViewController {
    
    var mainView: View { view as! View }
    
    override func loadView() {
        view = View()
    }
}
//MARK: - Get Current IndexPath
extension BaseViewController {
    
    func getCurrentIndexPath(withSender sender: UIButton, andCollectionView collectionView: UICollectionView) -> IndexPath? {
        
        var superview = sender.superview
        while let view = superview, !(view is UICollectionViewCell) {
            superview = view.superview
        }
        guard let cell = superview as? UICollectionViewCell else { return nil }
        guard let indexPath = collectionView.indexPath(for: cell) else { return nil }
        return indexPath
    }
}
