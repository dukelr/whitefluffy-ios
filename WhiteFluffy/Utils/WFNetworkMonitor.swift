//
//  WFNetworkMonitor.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import Foundation
import Network

protocol WFNetworkMonitorProtocol {
    var isConnected: Bool { get }
    func startMonitoring()
    func stopMonitoring()
}

final class WFNetworkMonitor: WFNetworkMonitorProtocol {
    private let monitor = NWPathMonitor()
    private(set) var isConnected = false
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                
                isConnected = path.status != .unsatisfied
            }
        }
        monitor.start(queue: .global())
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
