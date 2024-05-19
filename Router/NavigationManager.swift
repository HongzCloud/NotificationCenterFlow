//
//  NavigationManager.swift
//  NotificationCenterFlow
//
//  Created by 오킹 on 4/27/24.
//

import UIKit

class NavigationManager {
    let navigation = UINavigationController()
    
    init() {

        NotificationCenter.default.addObserver(self, selector: #selector(push(_:)),
                                               name: .push,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(present(_:)),
                                               name: .present,
                                               object: nil)
    }
    
    @objc func present(_ notification: Notification) {
        let a = UITabBarController()
        a.selectedViewController?.navigationController
        if let userInfo = notification.userInfo as? [String: Route],
           let route = userInfo["route"] {
            
            findNavigationController(viewController: findSceneRootViewController())?.present(route.viewController, animated:  true)
        }
    }
    
    @objc func push(_ notification: Notification) {
        if let userInfo = notification.userInfo as? [String: Route],
           let route = userInfo["route"] {
            
            findNavigationController(viewController: findSceneRootViewController())?.pushViewController(route.viewController, animated:  true)
        }
    }
    
    private func findSceneRootViewController() -> UIViewController? {
        return UIApplication.shared.connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }?
            .rootViewController
    }
    
    private func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController else { return nil }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        if let tabBarController = viewController as? UITabBarController {
            return findNavigationController(viewController: tabBarController.selectedViewController)
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        
        return nil
    }
 
}
