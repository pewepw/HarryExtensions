//
//  Extension+TextField.swift
//
//
//  Created by Harry on 01/05/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension UITextField {
    @objc public var substituteFontName : String {
        get {
            return self.font?.fontName ?? ""
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? ""
            var fontName = newValue
            
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold"
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium"
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light"
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight"
            } else {
                fontName += ""
            }
            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
    
    public func setLeftPadding(_ width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    public func setRightPadding(_ width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    public func setLeftView(imageNamed: String, containerFrame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40), imageViewFrame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40)) {
        let containerView = UIView(frame: containerFrame)
        let imageView = UIImageView(frame: imageViewFrame)
        imageView.image = UIImage(named: imageNamed)
        containerView.addSubview(imageView)
        leftView = containerView
        leftViewMode = UITextField.ViewMode.always
    }
    
    public func setRightView(imageNamed: String, containerFrame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40), imageViewFrame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40)) {
        let containerView = UIView(frame: containerFrame)
        let imageView = UIImageView(frame: imageViewFrame)
        imageView.image = UIImage(named: imageNamed)
        containerView.addSubview(imageView)
        rightView = containerView
        rightViewMode = UITextField.ViewMode.always
    }
}
