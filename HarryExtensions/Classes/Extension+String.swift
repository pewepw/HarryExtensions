//
//  Extension+String.swift
//
//
//  Created by Harry on 01/05/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension String {
    public func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    public func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
    
    public func isNumber() -> Bool {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }
    
    public var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf16) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    public var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    public func htmlAttributed(family: String?, size: CGFloat, colorHex: String?) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "color: #\(colorHex ?? "9A9A9A") !important;" +
                "font-family: \(family ?? "Helvetica"), Helvetica !important;" +
            "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    public var containsChineseCharacters: Bool {
        return self.range(of: "\\p{Han}", options: .regularExpression) != nil
    }
    
    public var containsLatinCharactersOnly: Bool {
        return self.range(of: "\\P{Latin}", options: .regularExpression) == nil
    }
    
    public func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()
        
        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }
        
        return results.map { String($0) }
    }
    
    public func formatNumberToFractionDigit(of count: Int) -> String {
        let value = Double(self) ?? 0.0
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = count
        formatter.maximumFractionDigits = count
        return formatter.string(from: NSNumber(value: value))!
    }
    
    public func convertFromStringToDate(format: String? = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
    
    public func removeCharacters(from forbiddenChars: CharacterSet) -> String {
        let passed = self.unicodeScalars.filter { !forbiddenChars.contains($0) }
        return String(String.UnicodeScalarView(passed))
    }
    
    public func removeCharacters(from: String) -> String {
        return removeCharacters(from: CharacterSet(charactersIn: from))
    }
    
    public func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
