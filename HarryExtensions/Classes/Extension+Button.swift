//
//  Extension+Button.swift
//  
//
//  Created by Harry on 03/07/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension UIButton {
    public func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: image.size.width)
        self.imageView?.contentMode = .scaleAspectFit
    }
}

