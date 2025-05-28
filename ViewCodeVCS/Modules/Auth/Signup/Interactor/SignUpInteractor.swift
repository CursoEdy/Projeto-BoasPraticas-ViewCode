//
//  SignUpInteractor.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 27/05/25.
//

import Foundation

class SignUpInteractor {
    var presenter: SignUpPresenter?
    
    func performSignUp() {
        presenter?.signUpSuccess()
    }
}
