//
//  LoginViewController.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 26/05/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    var interactor: LoginInteractor?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá!"
        label.font = .systemFont(ofSize: 60, weight: .light)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Entre com sua conta"
        return label
    }()
    
    private let createAccountLabel = UILabel()
    
    private let emailTextField = CustomTextField(
        placeholder: "email",
        icon: UIImage(systemName: "person")
    )
    
    private let passwordTextField = CustomTextField(
        placeholder: "senha",
        icon: UIImage(systemName: "lock"),
        isSecure: true
    )
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        button.layer.cornerRadius = 20
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupLinkLabel()
        loginButton.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
    }
    
    // MARK: Logica button logar
    @objc private func handleLoginButton() {
        let user = LoginModel.Request(
            username: emailTextField.text,
            password: passwordTextField.text
        )
        interactor?.performLogin(request: user)
    }
    
    //TODO: perform view signUP view.
    
    private func setupSubviews () {
        
        [titleLabel, subTitleLabel, createAccountLabel].forEach{
            $0.textColor = .darkGray
            $0.textAlignment = .center
        }
        [titleLabel, subTitleLabel, createAccountLabel, emailTextField, passwordTextField, loginButton].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            
            emailTextField.leadingAnchor.constraint(equalTo: subTitleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: subTitleLabel.trailingAnchor),
            emailTextField.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            createAccountLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            createAccountLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            createAccountLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            
        ])
    }
    
    //MARK: setup label link
    private func setupLinkLabel(){
        let fullText = "Não tem uma conta? Crie uma aqui."
        let linkText = "Crie uma aqui."
        
        let attributedString = NSMutableAttributedString(string: fullText)
        if let linkRange = fullText.range(of: linkText) {
            let nsRange = NSRange(linkRange, in: fullText)
            attributedString.addAttribute(.foregroundColor, value: UIColor.red.withAlphaComponent(0.5), range: nsRange)
        }
        
        createAccountLabel.attributedText = attributedString
        createAccountLabel.isUserInteractionEnabled = true
        createAccountLabel.textAlignment = .center
        createAccountLabel.numberOfLines = 0
        
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapLabel(_:)))
        createAccountLabel.addGestureRecognizer(tabGesture)
    }
    
    @objc func handleTapLabel(_ gesture: UITapGestureRecognizer) {
        
    guard let text = createAccountLabel.attributedText?.string else { return }
       let linkText = "Crie uma aqui."

       let nsText = NSString(string: text)
       let range = nsText.range(of: linkText)

       let layoutManager = NSLayoutManager()
       let textContainer = NSTextContainer(size: createAccountLabel.bounds.size)
       let textStorage = NSTextStorage(attributedString: createAccountLabel.attributedText!)

       layoutManager.addTextContainer(textContainer)
       textStorage.addLayoutManager(layoutManager)

       textContainer.lineFragmentPadding = 0
       textContainer.lineBreakMode = createAccountLabel.lineBreakMode
       textContainer.maximumNumberOfLines = createAccountLabel.numberOfLines

       let locationOfTouchInLabel = gesture.location(in: createAccountLabel)
       let index = layoutManager.characterIndex(for: locationOfTouchInLabel, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

       if NSLocationInRange(index, range) {
           print("Link tapped!")
           interactor?.navigateToSignUp()
       }
    }
}

#if DEBUG
import SwiftUI

struct MyViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            return LoginViewController()
        }
        .ignoresSafeArea()
    }
}
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let builder: () -> ViewController

    init(_ builder: @escaping () -> ViewController) {
        self.builder = builder
    }

    func makeUIViewController(context: Context) -> ViewController {
        builder()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}
#endif
