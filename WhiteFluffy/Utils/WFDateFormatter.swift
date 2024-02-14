//
//  WFDateFormatter.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import Foundation

protocol WFDateFormatterProtocol {
    var iso8601: ISO8601DateFormatter { get }
    
    func format(
        _ date: Date,
        dateFormat: WFDateFormatter.DateFormat,
        timeZone: TimeZone
    )  -> String
}

final class WFDateFormatter: WFDateFormatterProtocol {
    private let dateFormatter = DateFormatter()
    private(set) var iso8601 = ISO8601DateFormatter()
    
    func format(
        _ date: Date,
        dateFormat: DateFormat,
        timeZone: TimeZone
    ) -> String {
        dateFormatter.dateFormat = dateFormat.rawValue
        dateFormatter.timeZone = timeZone
        return dateFormatter.string(from: date)
    }
}

extension WFDateFormatter {
    enum DateFormat: String {
        case timeAndDate = "HH:mm dd.MM.yyyy"
        case iso8601 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    }
}
