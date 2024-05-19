//
//  AppRouter.swift
//  NotificationCenterFlow
//
//  Created by 오킹 on 4/27/24.
//

import Foundation

protocol AppRouter {
    associatedtype T = Route

    func navigation(to route: T)
    func present(to route: T)
}

extension AppRouter {

    func present(to route: T) {
        NotificationCenter.default.post(name: .present,
                                        object: nil,
                                        userInfo: ["route": route])
    }
    
    func navigation(to route: T) {
        NotificationCenter.default.post(name: .push,
                                        object: nil,
                                        userInfo: ["route": route])
    }
}
