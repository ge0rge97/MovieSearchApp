//
//  InternetConnectionViewModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 25.12.2022.
//

import Foundation

protocol InternetConnectionViewModelProtocol {
    
    var isInternetConnection: ViewModelObservable<Bool> { get }
}

class InternetConnectionViewModel: InternetConnectionViewModelProtocol {
    
    var isInternetConnection: ViewModelObservable<Bool>
    
    init() {
        self.isInternetConnection = ViewModelObservable(true)
        checkInternetConnection()
    }
    
    private func checkInternetConnection() {
        
        self.isInternetConnection.value = NetworkMonitor.shared.isConnected
        NetworkMonitor.shared.stopMonitoring()
    }
}
