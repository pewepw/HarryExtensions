//
//  Extension+Anchor.swift
//
//
//  Created by Harry on 01/05/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

public struct AnchoredConstraints {
    public var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    
    @discardableResult
    public func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    public func fillSuperview(ignoreSafeArea: Bool = false, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if ignoreSafeArea {
            if let superviewTopAnchor = superview?.topAnchor {
                topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
            }
            
            if let superviewBottomAnchor = superview?.bottomAnchor {
                bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
            }
            
            if let superviewLeadingAnchor = superview?.leadingAnchor {
                leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
            }
            
            if let superviewTrailingAnchor = superview?.trailingAnchor {
                trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
            }
        } else {
            if let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor {
                topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
            }
            
            if let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor {
                bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
            }
            
            if let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor {
                leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
            }
            
            if let superviewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor {
                trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
            }
        }
    }
    
    public func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    public func centerXTo(_ anchor: NSLayoutXAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    public func centerYTo(_ anchor: NSLayoutYAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    public func centerXInSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor, constant: constant).isActive = true
        }
    }
    
    public func centerYInSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY, constant: constant).isActive = true
        }
    }
    
    public func constrainWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    public func constrainHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    @discardableResult
    public func withSize(size: CGSize) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }
    
    @discardableResult
    public func withHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    public func withWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
}
