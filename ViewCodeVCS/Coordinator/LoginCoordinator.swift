//
//  LoginCoordinator.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 26/05/25.
//

import Foundation
import UIKit

class LoginCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVc = LoginViewController()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: loginVc, coordinator: self)
        
        loginVc.interactor = interactor
        interactor.presenter = presenter
        
        navigationController.pushViewController(loginVc, animated: true)
    }
    
    func goToSignUp() {
        let signUpVC = SignUpViewController()
        navigationController.pushViewController(signUpVC, animated: true)
    }
    
    func loginSuccess() {
        let homeViewController = ViewController()
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
