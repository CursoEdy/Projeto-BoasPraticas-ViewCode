//
//  CustomTextField.swift
//  ViewCodeVCS
//
//  Created by ednardo alves on 30/05/25.
//

import UIKit

class CustomTextField: UIView {

    private let iconImageView = UIImageView()
    private let textField = UITextField()
    private let eyeButton = UIButton(type: .system)
    private let isSecure: Bool
    
    var text: String {
        return textField.text ?? ""
    }
    
    init(placeholder: String, icon: UIImage?, isSecure: Bool = false) {
        self.isSecure = isSecure
        super.init(frame: .zero)
        setupViews(placeholder: placeholder, icon: icon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(placeholder: String, icon: UIImage?) {
        
        // Estilo container
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        
        // icon
        iconImageView.image = icon
        iconImageView.tintColor = .gray
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecure
        textField.autocapitalizationType = .none
        textField.borderStyle = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        // olhos toggle
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.isHidden = !isSecure
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        addSubview(iconImageView)
        addSubview(textField)
        addSubview(eyeButton)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            eyeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            eyeButton.widthAnchor.constraint(equalToConstant: 24),
            eyeButton.heightAnchor.constraint(equalToConstant: 24),
            
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            textField.trailingAnchor.constraint(equalTo: eyeButton.leadingAnchor, constant: -8),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])
    }
    
    @objc private func togglePasswordVisibility() {
        textField.isSecureTextEntry.toggle()
        let imageName = textField.isSecureTextEntry ? "eye" : "eye.slash"
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
