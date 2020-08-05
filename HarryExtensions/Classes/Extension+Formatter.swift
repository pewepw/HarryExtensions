//
//  Extension+Formatter.swift
//  
//
//  Created by Harry on 14/05/2020.
//  Copyright © 2019 Harry. All rights reserved.
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
    public var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

extension String {
    public var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: Double(self)) ?? ""
    }
}
