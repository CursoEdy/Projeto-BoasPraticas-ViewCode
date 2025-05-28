//
//  HomeViewController.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 27/05/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var onLogout: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home"
        setupSubviews()
    }
    
    @objc private func logoutTapped() {
        print("🔁 Botão de logout pressionado")
        onLogout?()
    }
    
    private func setupSubviews() {
        view.addSubview(logoutButton)
        
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}
