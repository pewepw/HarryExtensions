//
//  Extension+Navigation.swift
//
//
//  Created by Harry on 01/05/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

extension UIViewController {
    public func popTo(viewController: AnyClass) {
        let viewControllers = self.navigationController!.viewControllers as [UIViewController];
        for aViewController:UIViewController in viewControllers {
            if aViewController.isKind(of: viewController) {
                _ = self.navigationController?.popToViewController(aViewController, animated: true)
            }
        }
    }
    
    public func popNavigationController(count: Int) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - (count + 1)], animated: true)
    }
}
