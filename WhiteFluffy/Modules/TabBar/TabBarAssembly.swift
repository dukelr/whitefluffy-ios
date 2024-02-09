//
//  TabBarAssembly.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

protocol TabBarAssemblyProtocol {
    func assemble(tabItem: TabBarItem) -> TabBarController
}

struct TabBarAssembly: TabBarAssemblyProtocol {
    func assemble(tabItem: TabBarItem) -> TabBarController {
        TabBarController(tabItem: tabItem)
    }
}
