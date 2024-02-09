//
//  TabBarController.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

final class TabBarController: UITabBarController {
    // MARK: - Dependencies

    private let tabItem: TabBarItem
    
    init(tabItem: TabBarItem) {
        self.tabItem = tabItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle funcs

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup funcs
    
    private func setupUI() {
        viewControllers = TabBarItem.allCases.map { setupTabBarItem($0) }
        selectedIndex = tabItem.rawValue
    }
    
    private func setupTabBarItem(_ tabBarItem: TabBarItem) -> UINavigationController {
        let viewController: UIViewController = switch tabBarItem {
        case .gallery: GalleryAssembly().assemble()
        case .favoritePhotos: FavoritePhotosAssembly().assemble()
        }
        viewController.title = tabBarItem.title
        viewController.tabBarItem.image = tabBarItem.image
        return UINavigationController(rootViewController: viewController)
    }
}
