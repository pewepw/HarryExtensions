//
//  Extension+UIApplication.swift
//
//
//  Created by Harry on 05/08/2020.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension UIApplication {
    public class func topViewControllers(controller: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewControllers(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewControllers(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewControllers(controller: presented)
        }
        return controller
    }
}
