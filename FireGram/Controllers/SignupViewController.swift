//
//  ViewController.swift
//  FireGram
//
//  Created by Kyle Thompson on 12/28/18.
//  Copyright © 2018 Kyle Thompson. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    var db: DatabaseReference!
    var storage: StorageReference!

    unowned var signupView: SignupView { return self.view as! SignupView }
    unowned var profileButton: UIButton { return signupView.profileButton }
    unowned var emailTextField: UITextField { return signupView.emailTextField }
    unowned var usernameTextField: UITextField { return signupView.usernameTextField }
    unowned var passwordTextField: UITextField { return signupView.passwordTextField }
    unowned var confirmPasswordTextField: UITextField { return signupView.confirmPasswordTextField }
    unowned var signupButton: UIButton { return signupView.signupButton }
    unowned var loginLabel: UILabel { return signupView.loginLabel }
    unowned var termsLabel: UILabel { return signupView.termsLabel }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFirebase()
        setupActions()
    }
    
    public override func loadView() {
        self.view = SignupView()
    }
    
    private func setupFirebase() {
        db = Database.database().reference()
        storage = Storage.storage().reference()
    }
    
    private func setupActions() {
        profileButton.addTarget(self, action: #selector(SignupViewController.handleProfileImageSelection), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(SignupViewController.handleSignup), for: .touchUpInside)
        
        let loginTapped = UITapGestureRecognizer(target: self, action: #selector(SignupViewController.handleLogin))
        loginLabel.addGestureRecognizer(loginTapped)
        
        let termsAndConditionsTapped = UITapGestureRecognizer(target: self, action: #selector(SignupViewController.handleTermsAndConditions))
        termsLabel.addGestureRecognizer(termsAndConditionsTapped)
    }
    
    @objc func handleProfileImageSelection() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleLogin() {
        self.present(LoginViewController(), animated: false, completion: nil)
    }
    
    @objc func handleTermsAndConditions() {
        print("terms and cons")
    }
    
    @objc func handleSignup() {
        guard let email = emailTextField.text, email.count > 0 else { return }
        guard let username = usernameTextField.text, username.count > 0 else { return }
        guard let password = passwordTextField.text, password.count > 0 else { return }
        guard let confirmPassword = confirmPasswordTextField.text, confirmPassword.count > 0 else { return }
        guard password == confirmPassword else { return }
        
        guard let image = profileButton.imageView?.image else {
            fatalError("Could not access profile image view.")
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to create user: \(error)")
                return
            }
            
            guard let user = result?.user else {
               fatalError()
            }
            
            print("Successfully created user: \(user.uid).")
            
            guard let uploadData = image.jpegData(compressionQuality: 0.5) else {
                return
            }
            
            let filename = "\(UUID().uuidString).jpeg"
            let profileImageRef = self.storage.child("profile_images/\(filename)")

            profileImageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if let error = error {
                    print("Failed to upload profile image: \(error)")
                    return
                }
                
                profileImageRef.downloadURL { (url, error) in
                    if let error = error {
                        print("Failed to retrieve download url: \(error)")
                        return
                    }
                    
                    guard let url = url else { fatalError() }
                    
                    print(url)
                    
                    let userInfo = [
                        "username": username,
                        "profileImageUrl": url.absoluteString
                    ]
                    
                    let values = [user.uid: userInfo]
                    
                    self.db.child("users").updateChildValues(values) { (error, ref) in
                        
                        if let error = error {
                            print("Failed to save user info: \(error)")
                            return
                        }
                        
                        print("Successfully saved user info.")
                        self.present(MainTabBarController(), animated: true, completion: nil)
                    }
                }
            }
                

        }
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension SignupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileButton.setImage(editedImage, for: .normal)
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileButton.setImage(originalImage, for: .normal)
        }
        
        dismiss(animated: true, completion: nil)
    }
}

