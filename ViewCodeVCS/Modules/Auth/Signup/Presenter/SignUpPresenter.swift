//
//  SignUpPresenter.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 27/05/25.
//

import Foundation

class SignUpPresenter {
    weak var view: SignUpViewController?
    weak var coordinator: LoginCoordinator?
    
    init(view: SignUpViewController, coordinator: LoginCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func signUpSuccess() {
        coordinator?.goBackSignUp()
    }
    
}
