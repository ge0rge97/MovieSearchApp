//
//  SceneDelegate.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return  }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        if let _ = Auth.auth().currentUser {
            let tabBarController = TabBarController()
            self.window?.rootViewController = tabBarController
        } else {
            let enterVC = StartViewController()
            window?.rootViewController = enterVC
        }
        window?.makeKeyAndVisible()
    }
}

