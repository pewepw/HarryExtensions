//
//  Extension.swift
//
//
//  Created by Harry on 01/05/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension UIViewController {
    public func present(viewController: UIViewController,
                 modalPresentationStyle: UIModalPresentationStyle?,
                 modalTransitionStyle: UIModalTransitionStyle?) {
        viewController.modalPresentationStyle = modalPresentationStyle ?? .fullScreen
        viewController.modalTransitionStyle = modalTransitionStyle ?? .coverVertical
        present(viewController, animated: true, completion: nil)
    }
    
    public func setupSafeAreaBottomCoverView(onView view: UIView, color: UIColor = .white) -> UIView {
        let window = UIApplication.shared.windows.first
        let bottomPadding = window?.safeAreaInsets.bottom
        let safeAreaCoverView = UIView()
        safeAreaCoverView.backgroundColor = color
        view.addSubview(safeAreaCoverView)
        safeAreaCoverView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: -(bottomPadding ?? 10), right: 0), size: .init(width: 0, height: bottomPadding ?? 10))
        return safeAreaCoverView
    }

    public func setupSafeAreaTopCoverView(onView view: UIView, color: UIColor = .white) -> UIView {
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top
        let safeAreaCoverView = UIView()
        safeAreaCoverView.backgroundColor = color
        view.addSubview(safeAreaCoverView)
        safeAreaCoverView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: -(topPadding ?? 10), left: 0, bottom: 0, right: 0), size: .init(width: 0, height: topPadding ?? 10))
        return safeAreaCoverView
    }
    
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
        if UIDevice().userInterfaceIdiom == UIUserInterfaceIdiom.pad {
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
    
    public func convertToJSON(from object: Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    public func isJailBroken() -> Bool {
        if TARGET_IPHONE_SIMULATOR != 1 {
            // Check 1 : existence of files that are common for jailbroken devices
            if FileManager.default.fileExists(atPath: "/Applications/Cydia.app")
                || FileManager.default.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib")
                || FileManager.default.fileExists(atPath: "/bin/bash")
                || FileManager.default.fileExists(atPath: "/usr/sbin/sshd")
                || FileManager.default.fileExists(atPath: "/etc/apt")
                || FileManager.default.fileExists(atPath: "/private/var/lib/apt/")
                || UIApplication.shared.canOpenURL(URL(string:"cydia://package/com.example.package")!) {
                return true
            }
            // Check 2 : Reading and writing in system directories (sandbox violation)
            let stringToWrite = "Jailbreak Test"
            do {
                try stringToWrite.write(toFile:"/private/JailbreakTest.txt", atomically:true, encoding:String.Encoding.utf8)
                //Device is jailbroken
                return true
            } catch {
                return false
            }
        } else {
            return false
        }
    }
    
    public func showToast(message: String, font: UIFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium), textColor: UIColor = UIColor.white, backgroundColor: UIColor = UIColor.black) {
        let toastLabel = UILabel()
        toastLabel.textColor = textColor
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 0.0
        toastLabel.layer.cornerRadius = 6
        toastLabel.backgroundColor = backgroundColor
        toastLabel.clipsToBounds = true

        let toastWidth: CGFloat = toastLabel.intrinsicContentSize.width + 16
        let toastHeight: CGFloat = 32
        
        toastLabel.frame = CGRect(x: self.view.frame.width / 2 - (toastWidth / 2),
                                  y: self.view.frame.height - (toastHeight * 3),
                                  width: toastWidth, height: toastHeight)
        
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 1.5, delay: 0.25, options: .autoreverse, animations: {
            toastLabel.alpha = 1.0
        }) { _ in
            toastLabel.removeFromSuperview()
        }
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


