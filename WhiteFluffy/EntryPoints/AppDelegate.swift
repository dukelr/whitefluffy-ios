//
//  AppDelegate.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let database = WFAssembly.database
    private let window = WFAssembly.window
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        database.configure()
        window.configure()
        window.setRootViewController(TabBarAssembly().assemble(tabItem: .gallery))
        return true
    }
}
