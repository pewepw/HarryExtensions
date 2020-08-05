//
//  Extension+Data.swift
//  
//
//  Created by Harry on 05/08/2020.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension Data {
    public var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
