//
//  ViewController.swift
//  NotificationCenterFlow
//
//  Created by 오킹 on 4/26/24.
//

import UIKit

class ViewController: UIViewController, AppRouter {
    typealias T = AppRoute
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        navigation(to: .screen2)
        present(to: .screen1(id: 1))
    }
}
