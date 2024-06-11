//
//  TabBarController.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 11/06/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let placeHolderViewController = PlaceholderController(message: "Coming Soon...")
        placeHolderViewController.tabBarItem = UITabBarItem(title: "Tab 1", image: UIImage(systemName: "clock"), tag: 0)

        let mainViewController = MainViewController()
        mainViewController.tabBarItem = UITabBarItem(title: "Main Tab", image: UIImage(systemName: "fork.knife"), tag: 1)
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile Tab", image: UIImage(systemName: "person"), tag: 2)
        
        viewControllers = [placeHolderViewController, mainViewController, profileViewController]
        
        tabBar.barTintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            let tabBarHeight: CGFloat = 70
            let horizontalInset: CGFloat = 10
            let verticalInset: CGFloat = 40
            
            var tabFrame = tabBar.frame
            tabFrame.size.height = tabBarHeight
            tabFrame.origin.y = view.frame.height - tabBarHeight - verticalInset
            tabFrame.origin.x = horizontalInset
            tabFrame.size.width = view.frame.width - 2 * horizontalInset
            
            tabBar.frame = tabFrame
            tabBar.layer.cornerRadius = 15
            tabBar.layer.masksToBounds = true
        }
}