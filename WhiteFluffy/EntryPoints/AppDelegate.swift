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
    private let networkMonitor = WFAssembly.networkMonitor
    private let window = WFAssembly.window
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        database.configure()
        networkMonitor.startMonitoring()
        window.configure()
        window.setRootViewController(TabBarAssembly().assemble(tabItem: .gallery))
        return true
    }
}
