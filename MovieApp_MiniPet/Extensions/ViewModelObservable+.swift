//
//  ViewModelObservable+.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 23.12.2022.
//

import Foundation

class ViewModelObservable<T> {
    
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    init(_ v: T) {
        value = v
    }
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
}
