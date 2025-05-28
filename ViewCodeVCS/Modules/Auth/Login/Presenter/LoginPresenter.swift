//
//  LoginPresenter.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 26/05/25.
//

import Foundation

class LoginPresenter {
    weak var view: LoginViewController?
    weak var coordinator: LoginCoordinator?
    
    init(view: LoginViewController?, coordinator: LoginCoordinator?) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func loginSuccess() {
        print("✅ Login bem-sucedido, chamando coordinator")
        coordinator?.loginSuccess()
    }
    
    func loginFailed() {
        //TODO: Exibir um alerta na view
    }
    
    func goToSignUp() {
        coordinator?.goToSignUp()
    }
    
}
