//
//  Extension+Separator.swift
//  
//
//  Created by Harry on 05/08/2020.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
    public func setupSeparatorView(superview: UIView, hPadding: CGFloat, vPadding: CGFloat, onTop: Bool) {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.separator
        } else {
            view.backgroundColor = #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 1)
        }
        superview.addSubview(view)
        
        if onTop {
            view.anchor(top: superview.topAnchor, leading: superview.leadingAnchor, bottom: nil, trailing: superview.trailingAnchor, padding: .init(top: vPadding, left: hPadding, bottom: vPadding, right: hPadding), size: .init(width: 0, height: 0.5))
        } else {
            view.anchor(top: nil, leading: superview.leadingAnchor, bottom: superview.bottomAnchor, trailing: superview.trailingAnchor, padding: .init(top: vPadding, left: hPadding, bottom: vPadding, right: hPadding), size: .init(width: 0, height: 0.5))
        }
    }
    
    public func getSeparatorView() -> UIView {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.separator
        } else {
            view.backgroundColor = #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 1)
        }
        view.constrainHeight(constant: 0.5)
        return view
    }
}

extension UIViewController {
    public func setupSeparatorView(superview: UIView, hPadding: CGFloat, vPadding: CGFloat, onTop: Bool) {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.separator
        } else {
            view.backgroundColor = #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 1)
        }
        superview.addSubview(view)
        
        if onTop {
            view.anchor(top: superview.topAnchor, leading: superview.leadingAnchor, bottom: nil, trailing: superview.trailingAnchor, padding: .init(top: vPadding, left: hPadding, bottom: vPadding, right: hPadding), size: .init(width: 0, height: 0.5))
        } else {
            view.anchor(top: nil, leading: superview.leadingAnchor, bottom: superview.bottomAnchor, trailing: superview.trailingAnchor, padding: .init(top: vPadding, left: hPadding, bottom: vPadding, right: hPadding), size: .init(width: 0, height: 0.5))
        }
    }
}
