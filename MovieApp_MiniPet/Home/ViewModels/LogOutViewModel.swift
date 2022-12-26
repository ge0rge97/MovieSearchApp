//
//  LogOutViewModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 26.12.2022.
//

import Foundation

protocol LogOutViewModelOutput: AnyObject {
    func successLogOut()
}

protocol LogOutViewModelProtocol {
    
    var logOutOutput: LogOutViewModelOutput? { get set }
    func logOut()
}

class LogOutViewModel: LogOutViewModelProtocol {
    
    weak var logOutOutput: LogOutViewModelOutput?
    
    func logOut() {
        LoginAuthService.shared.logOut { result in
            switch result {
            case .success():
                self.logOutOutput?.successLogOut()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
