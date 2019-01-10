//
//  LoginViewController.swift
//  FireGram
//
//  Created by Kyle Thompson on 12/30/18.
//  Copyright © 2018 Kyle Thompson. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var isLoggingIn = true
    
    unowned var loginView: LoginView { return self.view as! LoginView }
    unowned var emailTextField: UITextField { return loginView.emailTextField }
    unowned var passwordTextField: UITextField { return loginView.passwordTextField }
    unowned var forgotPasswordLabel: UILabel { return loginView.forgotPasswordLabel }
    unowned var loginButton: UIButton { return loginView.loginButton }
    unowned var signupLabel: UILabel { return loginView.signupLabel }
    unowned var termsLabel: UILabel { return loginView.termsLabel }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActions()
    }
    
    public override func loadView() {
        self.view = LoginView()
    }
    
    private func setupActions() {
        loginButton.addTarget(self, action: #selector(LoginViewController.handleLogin), for: .touchUpInside)
        
        let signupTapped = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleSignup))
        signupLabel.addGestureRecognizer(signupTapped)
        
        let forgotPasswordTapped = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleForgotPassword))
        forgotPasswordLabel.addGestureRecognizer(forgotPasswordTapped)
        
        let termsAndConditionsTapped = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTermsAndConditions))
        termsLabel.addGestureRecognizer(termsAndConditionsTapped)
    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text, email.count > 0 else {
            // set invalid label
            return
        }
        
        guard let password = passwordTextField.text, password.count > 0 else {
            // set invalid label
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error)
                return
            }
            
            if result != nil {
                self.present(MainTabBarController(), animated: true, completion: nil)
            }
        }
    }
    
    @objc func handleSignup() {
        self.present(SignupViewController(), animated: false, completion: nil)
    }
    
    @objc func handleForgotPassword() {
        print("forgot pass")
    }
    
    @objc func handleTermsAndConditions() {
        print("terms and cons")
    }
}
