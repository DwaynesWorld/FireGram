//
//  SignupView.swift
//  FireGram
//
//  Created by Kyle Thompson on 12/30/18.
//  Copyright © 2018 Kyle Thompson. All rights reserved.
//

import UIKit

class SignupView: BaseView {

    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "FireGram"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let logo: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "flame")?.withRenderingMode(.alwaysTemplate)
        view.image = image
        view.tintColor = primaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to FireGram, signup for your account."
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account? Login"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        label.textColor = primaryColor
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public let profileButton: UIButton = {
        let image = UIImage(named: "ic_add_a_photo_48pt")?.withRenderingMode(.alwaysTemplate)
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 5
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = primaryColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.backgroundColor = UIColor(white: 1, alpha: 0.95)
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    public let usernameTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        field.backgroundColor = UIColor(white: 1, alpha: 0.95)
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    public let passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.backgroundColor = UIColor(white: 1, alpha: 0.95)
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    public let confirmPasswordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Confirm Password"
        field.isSecureTextEntry = true
        field.backgroundColor = UIColor(white: 1, alpha: 0.95)
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    public let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Signup", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(primaryTextColor, for: .normal)
        button.backgroundColor = primaryColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "By Signing up, you agree to FireGram's"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let termsLabel: UILabel = {
        let label = UILabel()
        label.text = "Terms & Conditions and Privacy Policy"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        label.textColor = .darkGray
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override func setup() {
        super.setup()
        
        setupView()
        setupSubViews()
        setupConstraints()
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupSubViews() {
        addSubview(titleLabel)
        addSubview(logo)
        addSubview(welcomeLabel)
        addSubview(loginLabel)
        addSubview(profileButton)
        addSubview(emailTextField)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(signupButton)
        addSubview(footerLabel)
        addSubview(termsLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            logo.widthAnchor.constraint(equalToConstant: 150),
        ])
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            logo.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            logo.widthAnchor.constraint(equalToConstant: 50),
            logo.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 250),
        ])
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 4),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            loginLabel.widthAnchor.constraint(equalToConstant: 250),
        ])
        
        NSLayoutConstraint.activate([
            profileButton.heightAnchor.constraint(equalToConstant: 120),
            profileButton.widthAnchor.constraint(equalToConstant: 120),
            profileButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileButton.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 30),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            emailTextField.widthAnchor.constraint(equalToConstant: 250),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            usernameTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            usernameTextField.widthAnchor.constraint(equalToConstant: 250),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            passwordTextField.widthAnchor.constraint(equalToConstant: 250),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            confirmPasswordTextField.widthAnchor.constraint(equalToConstant: 250),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
        ])

        NSLayoutConstraint.activate([
            signupButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 20),
            signupButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            signupButton.widthAnchor.constraint(equalToConstant: 100),
            signupButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            footerLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60),
            footerLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            footerLabel.widthAnchor.constraint(equalToConstant: 250),
            footerLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        NSLayoutConstraint.activate([
            termsLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -45),
            termsLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            termsLabel.widthAnchor.constraint(equalToConstant: 250),
            termsLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
