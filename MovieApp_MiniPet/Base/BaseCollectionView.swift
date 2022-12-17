//
//  BaseCollectionView.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class BaseCollectionView: UICollectionView {
    // MARK: - Init
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    convenience init(withLayout layout: UICollectionViewLayout) {
        let layout = layout
        self.init(frame: .zero, collectionViewLayout: layout)
        configureAppearance()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
// MARK: - Private Methods -> Configure CollectionView
private extension BaseCollectionView {
    func configureAppearance() {
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
