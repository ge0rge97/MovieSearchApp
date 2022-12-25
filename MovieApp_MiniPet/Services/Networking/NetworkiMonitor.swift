//
//  NetworkMonitor.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 25.12.2022.
//

import Foundation
import Network

final class NetworkiMonitor {
    
    static let shared = NetworkiMonitor()
    
    private let monitor: NWPathMonitor
    private let queue = DispatchQueue(label: "NetworkConnectivityMonitor")
    private(set) var isConnected: Bool = true
    private(set) var interfaceType: NWInterface.InterfaceType?
    
    private init() {
        self.monitor = NWPathMonitor()
    }

    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status != .unsatisfied
            self?.interfaceType = NWInterface.InterfaceType.allCases.filter {
                path.usesInterfaceType($0)
            }.first
        }
        monitor.start(queue: queue)
    }
    func stopMonitoring() {
        monitor.cancel()
    }
}
// MARK: - Interface Type
extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [
        .wiredEthernet,
        .wifi,
        .cellular,
        .loopback,
        .other
    ]
}
