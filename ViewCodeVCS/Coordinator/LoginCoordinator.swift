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
    weak var appCoordinator: AppCoordinator?
    
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
        let interactor = SignUpInteractor()
        let presenter = SignUpPresenter(view: signUpVC, coordinator: self)
        
        signUpVC.iteractor = interactor
        interactor.presenter = presenter
        
        navigationController.pushViewController(signUpVC, animated: true)
    }
    
    func goBackSignUp(){
        navigationController.popViewController(animated: true)
    }
    
    func loginSuccess() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        appCoordinator?.showHome()
    }
}
