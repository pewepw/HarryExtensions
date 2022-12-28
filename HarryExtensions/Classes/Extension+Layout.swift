//
//  Extension+Layout.swift
//
//
//  Created by Harry on 17/05/2022.
//



import UIKit

class Layout {
    private static var defaultFontName: String = ""
    private static var defaultTextColor: UIColor = UIColor.gray
    
    public static func setDefaultFont(fontName: String, textColor: UIColor) {
        defaultFontName = fontName
        defaultTextColor = textColor
    }
    
    public static func createLabel(_ text: String, font: String? = defaultFontName, size: CGFloat? = 16, color: UIColor? = defaultTextColor, textAlignment: NSTextAlignment? = .left, numberOfLines: Int? = 1, isUnderlined: Bool? = false, adjustsFontSizeToFitWidth: Bool? = false) -> UILabel {
        let label = UILabel()
        label.numberOfLines = numberOfLines ?? 1
        label.textColor = color
        label.textAlignment = textAlignment ?? .left
        label.font = UIFont(name: font ?? defaultFontName, size: size ?? 16)
        label.text = text
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth ?? false
        if let isUnderlined = isUnderlined, isUnderlined {
            label.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue])
        }
        return label
    }
    
    public static func createTextField(_ placeholder: String, font: String? = defaultFontName, size: CGFloat? = 16, color: UIColor? = defaultTextColor, textAlignment: NSTextAlignment? = .left, keyboardType: UIKeyboardType? = .default, haveBorder: Bool = false) -> UITextField {
        let tf = UITextField()
        tf.textColor = color
        tf.textAlignment = textAlignment ?? .left
        tf.font = UIFont(name: font ?? defaultFontName, size: size ?? 16)
        tf.placeholder = placeholder
        tf.keyboardType = keyboardType ?? .default
        tf.borderStyle = haveBorder ? .roundedRect : .none
        return tf
    }
    
    public static func createView(backgroundColor: UIColor = .white, cornerRadius: CGFloat = 0, clipsToBounds: Bool? = true) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = clipsToBounds ?? true
        return view
    }
    
    public static func createImageView(named: String, contentMode: UIImageView.ContentMode? = .scaleAspectFit, tintColor: UIColor? = nil, cornerRadius: CGFloat = 0) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: named)
        imageView.contentMode = contentMode ?? .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = tintColor ?? nil
        imageView.layer.cornerRadius = cornerRadius
        return imageView
    }
    
    public static func createSystemImageView(systemName: String, tintColor: UIColor? = nil) -> UIImageView {
        let imageView = UIImageView()
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: systemName)
        } else {
            // Fallback on earlier versions
        }
        imageView.clipsToBounds = true
        imageView.tintColor = tintColor ?? nil
        return imageView
    }
    
    public static func createButton(_ title: String, font: String? = defaultFontName, size: CGFloat? = 16, color: UIColor? = defaultTextColor, backgroundColor: UIColor? = .white, cornerRadius: CGFloat? = 0, imageName: String? = nil, self: Any?, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont(name: font ?? defaultFontName, size: size ?? 16)
        button.backgroundColor = backgroundColor
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.isUserInteractionEnabled = true
        button.layer.cornerRadius = cornerRadius ?? 0
        
        if let imageName = imageName {
            button.setImage(UIImage(named: imageName), for: .normal)
        }
        return button
    }
}


