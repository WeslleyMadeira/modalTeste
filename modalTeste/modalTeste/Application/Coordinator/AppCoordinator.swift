//
//  AppCoordinator.swift
//  modalTeste
//
//  Created by Weslley Madeira on 24/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator{
    
    var navigationController = UINavigationController()
    
    private let window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        self.showHome()
    }
    
    func showHome() {
        let coordinator = HomeListCoordinator().start()
        self.navigationController.viewControllers = [coordinator.controller]
        
    }
}
