//
//  AppRoute.swift
//  NotificationCenterFlow
//
//  Created by 오킹 on 4/26/24.
//

import UIKit

protocol Route {
    var viewController: UIViewController { get }
}

enum AppRoute: Route {
    case screen1(id: Int)
    case screen2
    
    var viewController: UIViewController {
        switch self {
        case .screen1(let id):
            let vc = RedViewController()
            return vc
        case .screen2:
            let vc = BlueViewController()
            return vc
        }
    }
}
