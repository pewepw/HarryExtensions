//
//  Extension.swift
//
//
//  Created by Harry on 01/05/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension UIViewController {
    public func isValidEmailAddress(emailAddressString: String) -> Bool {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    public func isIpad() -> Bool{
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            return true
        } else {
            return false
        }
    }
    
    public func randomAlphaNumericString(length: Int) -> String {
        let allowedChars = "abcdfghjklmnpqrstvwxyz01234567890"
        let allowedCharsCount = UInt32(allowedChars.count)
        var randomString = ""
        
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
}

extension UIApplication {
    public var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}


