//
//  TabBarController.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit
//MARK: - Tabs For TabBar
enum Tabs: Int, CaseIterable {
    case home
    case list
    case search
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureAppearance()
        selectTab(withTab: .home)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension TabBarController {
    
    private func configureAppearance() {
        
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()

        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: R.Colors.mainWhite]
        tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: R.Colors.separator]
        tabBarAppearance.backgroundColor = R.Colors.mainBackground
        
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        tabBar.tintColor = R.Colors.mainWhite
        
        let controllers: [BaseNavigationController] = Tabs.allCases.map { tab in
            let controller = BaseNavigationController(rootViewController: getControllers(forTab: tab))
            controller.tabBarItem = UITabBarItem(title: R.TabBar.setTitle(withTab: tab),
                                                   image: R.TabBar.setIcon(withTab: tab),
                                                   tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: true)
    }
    private func getControllers(forTab tab: Tabs) -> UIViewController {
        switch tab {
        case .home:
            return HomeViewController()
        case .list:
            return UIViewController()
        case .search:
            return UIViewController()
        }
    }
    private func selectTab(withTab tab: Tabs) {
        selectedIndex = tab.rawValue
    }
}
//MARK: - TabBar Resources
extension Resources {
    enum TabBar {
        
        static func setTitle(withTab tab: Tabs) -> String? {
            switch tab {
            case .home:
                return "Home"
            case .list:
                return "List"
            case .search:
                return "Search"
            }
        }
        static func setIcon(withTab tab: Tabs) -> UIImage? {
            switch tab {
            case .home:
                return UIImage(systemName: "house")
            case .list:
                return UIImage(systemName: "bookmark")
            case .search:
                return UIImage(systemName: "magnifyingglass")
            }
        }
    }
}
