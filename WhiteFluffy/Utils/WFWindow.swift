//
//  WFWindow.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

final class WFWindow {
    private var window: UIWindow?
    
    func configure() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .dark
    }
    
    func setRootViewController(_ viewController: UIViewController) {
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
