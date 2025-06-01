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
    
    //Guarda a propriedade loginCoordinator para manter a instancia
    var loginCoordinator: LoginCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
            print("Indo para Home")
            showHome()
        } else {
            print("Voltando para Login")
            showLogin()
        }
    }
    
    func showLogin() {
        navigationController.setViewControllers([], animated: false)
            
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.appCoordinator = self
        self.loginCoordinator = loginCoordinator // <- mantendo a instancia
        loginCoordinator.start()
    }
    
    func showHome() {
        
        //  set nil para liberar a memoria do fluxo anterior e evitar objetos  desnecessarios após a transição
        loginCoordinator = nil
        
        let homeVc = HomeViewController()
        homeVc.onLogout = { [weak self] in
            print("Voltando para Login")
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
            self?.showLogin()
        }
        navigationController.setViewControllers([homeVc], animated: true)
    }
}
    
