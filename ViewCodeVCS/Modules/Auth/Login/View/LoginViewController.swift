//
//  LoginViewController.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 26/05/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    var interactor: LoginInteractor?
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.translatesAutoresizingMaskIntoConstraints =  false
        return label
    }()
    
    private let labelDesc: UILabel = {
        let label = UILabel()
        label.text = "Bem vindo a tela de Login!"
        label.translatesAutoresizingMaskIntoConstraints =  false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }
    
    //TODO: criar perform para rota main após login com êxito.
    
    //TODO: perform view signUP view.
    
    private func setupSubviews () {
        view.addSubview(label)
        view.addSubview(labelDesc)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 40),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            labelDesc.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            labelDesc.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            labelDesc.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
        ])
    }

}
