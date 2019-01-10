//
//  MainTabBarController.swift
//  FireGram
//
//  Created by Kyle Thompson on 12/30/18.
//  Copyright © 2018 Kyle Thompson. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        let mainUserProfileController = UINavigationController(rootViewController: userProfileController)
        mainUserProfileController.tabBarItem.image = UIImage(named: "ic_person_36pt")
        mainUserProfileController.tabBarItem.title = "Profile"

        let v1 = UIViewController()
        
        let v2 = UIViewController()
        
        let v3 = UIViewController()
        
        let v4 = UIViewController()
        
        viewControllers = [v1, v2, v3, v4, mainUserProfileController]
        selectedViewController = mainUserProfileController
    }
}
