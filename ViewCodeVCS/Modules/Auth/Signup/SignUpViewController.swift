//
//  SignUpViewController.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 26/05/25.
//

import UIKit

final class SignUpViewController: UIViewController {
    var iteractor: SignUpInteractor?
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        button.addTarget(self, action: #selector (handleSignUp), for: .touchUpInside)
        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func handleSignUp() {
        print("Sign Up")
    }
}
