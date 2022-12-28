//
//  Extension+Separator.swift
//  
//
//  Created by Harry on 05/08/2020.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
    public func setupSeparatorView(superview: UIView, hPadding: CGFloat, vPadding: CGFloat, onTop: Bool, color: UIColor? = UIColor.separator) {
        let view = UIView()
        view.backgroundColor = color
        superview.addSubview(view)
        
        if onTop {
            view.anchor(top: superview.topAnchor, leading: superview.leadingAnchor, bottom: nil, trailing: superview.trailingAnchor, padding: .init(top: vPadding, left: hPadding, bottom: vPadding, right: hPadding), size: .init(width: 0, height: 0.5))
        } else {
            view.anchor(top: nil, leading: superview.leadingAnchor, bottom: superview.bottomAnchor, trailing: superview.trailingAnchor, padding: .init(top: vPadding, left: hPadding, bottom: vPadding, right: hPadding), size: .init(width: 0, height: 0.5))
        }
    }
    
    public func getSeparatorView(color: UIColor? = UIColor.separator) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.constrainHeight(constant: 0.5)
        return view
    }
}

extension UIViewController {
    public func setupSeparatorView(superview: UIView, hPadding: CGFloat, vPadding: CGFloat, onTop: Bool, color: UIColor? = UIColor.separator) {
        let view = UIView()
        view.backgroundColor = color
        superview.addSubview(view)
        
        if onTop {
            view.anchor(top: superview.topAnchor, leading: superview.leadingAnchor, bottom: nil, trailing: superview.trailingAnchor, padding: .init(top: vPadding, left: hPadding, bottom: vPadding, right: hPadding), size: .init(width: 0, height: 0.5))
        } else {
            view.anchor(top: nil, leading: superview.leadingAnchor, bottom: superview.bottomAnchor, trailing: superview.trailingAnchor, padding: .init(top: vPadding, left: hPadding, bottom: vPadding, right: hPadding), size: .init(width: 0, height: 0.5))
        }
    }
}
