//
//  Extension+Formatter.swift
//  HarryExtensions
//
//  Created by Harry on 14/05/2020.
//

import UIKit

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}

extension Double {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

extension String {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: Double(self)) ?? ""
    }
}
