//
//  LoginInteractor.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 26/05/25.
//

import Foundation

class LoginInteractor {
    var presenter: LoginPresenter?
    
    //TODO: Criar um entidade userModel
    func performLogin(username: String, password: String){
        if username == "edy" && password == "123456"{
            print("Login realizado com sucesso!")
        } else {
            print("Dados incorretos")
        }
    }
    
    func navigateToSignUp(){
        print("Navegando para tela de cadastro")
    }
}
