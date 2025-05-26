//
//  AppCoordinator.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 24/05/25.
//

import Foundation
import UIKit

final class AppCoordinator {
    var window: UIWindow
    var navigationController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
            showHome()
        } else {
            showLogin()
        }
    }
    
    func showLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.start()
    }
    
    func showHome() {
        //show main/home app screen 
    }
}
    
