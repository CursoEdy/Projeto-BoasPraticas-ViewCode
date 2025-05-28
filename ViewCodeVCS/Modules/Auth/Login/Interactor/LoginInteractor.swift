//
//  LoginInteractor.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 26/05/25.
//

import Foundation

class LoginInteractor {
    var presenter: LoginPresenter?
    
    func performLogin(request: LoginModel.Request){
        if request.username == "edy" && request.password == "123456"{
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            presenter?.loginSuccess()
        } else {
            presenter?.loginFailed()
        }
    }
    
    func navigateToSignUp(){
        print("Navegando para tela de cadastro")
    }
}
