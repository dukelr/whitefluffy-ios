//
//  WFBackendErrorHandler.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import Foundation
import Alamofire

private enum Constant {
    static let serverIssueResponseCodes = 500..<600
}

extension WFBackend {
    final class ErrorHandler {
        private let networkMonitor: WFNetworkMonitorProtocol
        
        private let decoder = JSONDecoder()
        
        init(networkMonitor: WFNetworkMonitorProtocol) {
            self.networkMonitor = networkMonitor
        }
        
        func handle<T>(
            response: DataResponse<T, AFError>,
            completion: ((ErrorType) -> Void)?
        ) {
            guard let error = validateNetworkIssueError(error: response.error) ??
                    validateServerIssueError(error: response.error) else {
                completion?(ErrorType.unknown)
                return
            }
            completion?(error)
        }
        
        private func validateNetworkIssueError(error: AFError?) -> ErrorType? {
            if !networkMonitor.isConnected { return .networkIssue }
            
            guard let error = error?.underlyingError as? URLError else { return nil }
            
            return switch error.code {
            case .timedOut, .notConnectedToInternet, .networkConnectionLost: .networkIssue
            default: nil
            }
        }
        
        private func validateServerIssueError(error: AFError?) -> ErrorType? {
            guard let error, let responseCode = error.responseCode else { return nil }
            
            return switch responseCode {
            case Constant.serverIssueResponseCodes: .serverIssue
            default: nil
            }
        }
    }
}
