//
//  LoginViewController.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 26/05/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    var interactor: LoginInteractor?
    
    private let labelDesc: UILabel = {
        let label = UILabel()
        label.text = "Bem vindo a tela de Login!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints =  false
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }
    
    //TODO: criar perform para rota main após login com êxito.
    
    //TODO: perform view signUP view.
    
    private func setupSubviews () {
        view.addSubview(labelDesc)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            labelDesc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelDesc.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            labelDesc.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            loginButton.leadingAnchor.constraint(equalTo: labelDesc.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: labelDesc.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: labelDesc.bottomAnchor, constant: 20),
        ])
    }

}
