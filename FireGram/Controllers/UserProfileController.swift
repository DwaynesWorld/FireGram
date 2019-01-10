//
//  UserProfileController.swift
//  FireGram
//
//  Created by Kyle Thompson on 12/30/18.
//  Copyright © 2018 Kyle Thompson. All rights reserved.
//

import UIKit
import Firebase
import CodableFirebase

class UserProfileController: UICollectionViewController {
    
    let HeaderCellId = "HeaderCellId"
    let CellId = "CellId"
    
    var db: DatabaseReference!
    var storage: StorageReference!
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFirebase()
        setupLogoutButton()
        setupCollectionView()
        fetchCurrentUser()
    }
    
    private func setupFirebase() {
        db = Database.database().reference()
        storage = Storage.storage().reference()
    }
    
    private func setupLogoutButton() {
        let settingesButton = UIBarButtonItem(
            image: #imageLiteral(resourceName: "ic_settings_36pt"),
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(UserProfileController.handleSettingsTouched))
        
        settingesButton.tintColor = .black
        navigationItem.rightBarButtonItem = settingesButton
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        
        collectionView.register(
            UserProfileHeaderCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCellId)
        
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: CellId)
    }
    
    private func fetchCurrentUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        db.child("users").child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let value = snapshot.value else { return }
            
            do {
                self.user = try FirebaseDecoder().decode(User.self, from: value)
                self.navigationItem.title = self.user!.username
                self.collectionView.reloadData()
            } catch {
                print(error)
            }
            
        }
    }
    
    @objc func handleSettingsTouched() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
            do {
                try Auth.auth().signOut()
            } catch {
                print(error)
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
}


// MARK: - CollectionView Operations
extension UserProfileController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        
        return 7
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: CellId,
                for: indexPath)
        
        cell.backgroundColor = .purple
        
        return cell
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView
            .dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderCellId,
                for: indexPath) as! UserProfileHeaderCell
        
        header.user = user
        
        return header
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    
}
