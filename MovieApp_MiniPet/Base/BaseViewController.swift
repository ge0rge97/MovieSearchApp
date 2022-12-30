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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
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
//MARK: - Custom Alerts
extension BaseViewController {
    
    func getAlertWithError(error: String) {
        let alert = UIAlertController(title: "Opps, there is some error!", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .default))
        present(alert, animated: true)
    }
}
